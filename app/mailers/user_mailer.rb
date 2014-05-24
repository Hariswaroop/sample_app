class UserMailer < ActionMailer::Base
  default from: "sknhkn.gang@gmail.com"

  def welcome_email(user)
  	@user=user
  	# @url='http://localhost:3000/signin'
  	mail(to: @user.email, subject: 'Welcome to my site')
  end
end
