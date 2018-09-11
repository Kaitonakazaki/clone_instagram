class InstagramMailer < ApplicationMailer
  def instagram_mail(instagram)
     @instagram = instagram
     @user_email = @instagram.user.email
     mail to: @user_email, subject: "お問い合わせの確認メール"
  end
end
