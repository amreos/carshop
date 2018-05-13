require 'test_helper'

class NotificationsTest < ActionMailer::TestCase
  test "signup" do
    mail = Notifications.signup
    assert_equal "Signup", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "forgot_password" do
    mail = Notifications.forgot_password
    assert_equal "Forgot password", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "CommentMailer" do
    mail = Notifications.CommentMailer
    assert_equal "Commentmailer", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "new_comment" do
    mail = Notifications.new_comment
    assert_equal "New comment", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
