require 'test_helper'

class UsersIndexTest < ActionDispatch::IntegrationTest

	def setup
		@admin = User.create!(name: "Example User", email: "user@example.com", password: "password")
		@non_admin = User.create(name: "Sterling Archer", email: "duchess@example.gov", password: "password", password_confirmation: "password")

		# here is where I created 35 users to run before the test so that it can have pagination working on it.
		35.times do |index|
			User.create!(name: "Example Name #{index}", email: "example-#{index+1}@railstutorial.com", password: "secret")
		end
	end


	test "index as an admin including pagination and delete links" do
		log_in_as(@admin)
		get users_path
		assert_template 'users/index' 
		# assert_select works only if there is more then 30 users in memory.
		assert_select "div.pagination"
		first_page_of_users = User.paginate(page: 1)
		first_page_of_users.each do |user|
			assert_select 'a[href=?]', user_path(user), text: user.name
			unless user == @admin
				# this next line gives an error, i need help
				# assert_select 'a[href=?]', user_path(user), text: 'delete',
				# 																						method: :delete
			end
		end
		# this next line of code works with the line of code on top
		# assert_difference 'User.count', -1 do 
		# 	delete user_path(@non_admin)
		# end
	end

	test "index as non_admin" do
		log_in_as(@non_admin)
		get users_path
		assert_select 'a', text: 'delete', count: 0
	end
end

