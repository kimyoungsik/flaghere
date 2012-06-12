class UserMailer < ActionMailer::Base
  default from: "info@mangomountain.kr"

  def update_confirmation(user)
    @user = user

    mail to: user.email, subject: "update confirmation"
  end
end
