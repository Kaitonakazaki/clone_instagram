class InstagramMailer < ApplicationMailer
  def instagram_mail(instagram)
     @instagram = instagram
     @user_email = @instagram.user.email
     mail to: @user_email, subject: "投稿の確認メール"
  end
end
