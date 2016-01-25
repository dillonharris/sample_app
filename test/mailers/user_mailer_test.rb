require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "account_activation" do
    user = User.create(name: "Example User", email: "user@example.com",
                     password: "foobar", password_confirmation: "foobar", activated: true, activated_at: Time.zone.now)
    user.activation_token = User.new_token
    mail = UserMailer.account_activation(user)
    assert_equal "Account activation", mail.subject
    assert_equal [user.email], mail.to
    assert_equal ["noreply@example.com"], mail.from
    assert_match user.name,               mail.body.encoded
    assert_match user.activation_token,   mail.body.encoded
    assert_match CGI::escape(user.email), mail.body.encoded
  end
end
