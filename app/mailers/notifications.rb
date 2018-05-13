class Notifications < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications.signup.subject
  # http://localhost:3000/rails/mailers/notifications/signup
  def signup(user)
    @greeting = "Hi"

    mail to: "user.email"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications.forgot_password.subject
  # cee the preview of emails http://localhost:3000/rails/mailers/notifications/forgot_password
  def forgot_password(user)
    @greeting = "Hi"

    mail to: "user.email"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications.CommentMailer.subject
  # see preview here http://localhost:3000/rails/mailers/notifications/CommentMailer
  def CommentMailer(user)
    @greeting = "Hi"

    mail to: "user.email"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications.new_comment.subject
  # see previews here http://localhost:3000/rails/mailers/notifications/new_comment
  def new_comment(user)
    @greeting = "Hi"
    mail to: "user.email"
  end
end
