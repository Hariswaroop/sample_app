class UserMailer < ActionMailer::Base
  default from: "sknhkn2014@gmail.com"

  def welcome_email(user)
  	@user=user
  	# @url='http://localhost:3000/signin'
	mail(to: "#{user.name} <#{user.email}>", subject: 'Welcome to the site')
  end
end
