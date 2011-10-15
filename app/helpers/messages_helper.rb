module MessagesHelper

  def send_log_mail(user,log_type,messid)
    case log_type
	when "UserUpdate"
	  # time to log the email regardless if the send is confirmed
	  # First we test to see if this is a re-send of a previously failed msg (messid won't be -1)
	  if messid > -1
#	    Resending an email that previously failed, so load up the record
		mess = Message.find(messid)
		UserMailer.welcome_email(mess).deliver
	  else
#	    This is a new message, so create and save
		mess = Message.new(:email => @user.email, :name => @user.name, :section => log_type, :confirm_send => false)
	    mess.save
		UserMailer.acct_mod_email(@user).deliver
	  end	  
	  
	  # If we made it here without error, the email was sent - time to update log
	  mess.confirm_send = true
	  mess.save
	when "UserNew"
	  # time to log the email regardless if the send is confirmed
	  # First we test to see if this is a re-send of a previously failed msg (messid won't be -1)
	  if messid > -1
#	    Resending an email that previously failed, so load up the record
		mess = Message.find(messid)
		UserMailer.welcome_email(mess).deliver
	  else
#	    This is a new message, so create and save
		mess = Message.new(:email => @user.email, :name => @user.name, :section => log_type, :confirm_send => false)
	    mess.save
		UserMailer.welcome_email(@user).deliver
	  end	  

	  # If we made it here without error, the email was sent - time to update log
	  mess.confirm_send = true
	  mess.save
	else
	  UserMailer.error_email(@user, "MessagesHelper.send_log_mail --> CASE type doesn't exist").deliver
	end
  end
  	
end
