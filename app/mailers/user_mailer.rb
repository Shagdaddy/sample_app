class UserMailer < ActionMailer::Base
  default :from => "SirShagdaddy@gmail.com"
  
  def welcome_email(user)
    @user = user
    @url  = "http://127.0.0.1:3000"
    mail(:to => user.email, :subject => "Welcome to RecruitMGR.com")
    end
  
  def acct_mod_email(user)
    @user = user
    @url  = "http://127.0.0.1:3000"
    mail(:to => user.email, :subject => "You're information has changed at RecruitMGR.com")
  end
  
  #Special email for sending error messages
  def error_email(user, emsg)
    @user = user
	@emsg = emsg
	mail(:to => "shagdaddy@gmail.com", :subject => "Error message from RecruitMGR.com ")
  end

end
