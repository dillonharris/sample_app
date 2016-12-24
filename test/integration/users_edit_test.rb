require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest

	def setup
		@user = User.create(name: "Foo Bar", email: "foo@bar.com",
										 password: "foobar", password_confirmation: "foobar")
	end

	test "unsuccessful edit" do
		# log_in_as(@user) # This method is not working in the test loging in a user as it should.

		# manually logged in with the get & patch request.
		get login_path
		post login_path, session: { email: @user.email, password: 'foobar' }

		get edit_user_path(@user)
		assert_template 'users/edit'
		patch user_path(@user), user: { name: "",
																	 email: "user@invalid",
																	 password: "foo",
																	 password_confirmation: "bar" }
		assert_template 'users/edit'
	end

	test "successful edit with friendly forwarding" do
		get edit_user_path(@user)
		# log_in_as(@user) # Same as the above log_in_as method.
		# manually logged in with the get & patch request.
		get login_path
		post login_path, session: { email: @user.email, password: 'foobar' }

		assert_redirected_to edit_user_path(@user)
		name = "Foo Bar"
		email = "foo@bar.com"
		patch user_path(@user), user: { name: name,
																		email: email,
																		password: "",
																		password_confirmation: "" }
		assert_not flash.empty?
		assert_redirected_to @user
		@user.reload
		assert_equal @user.name, name
		assert_equal @user.email, email
	end
end

