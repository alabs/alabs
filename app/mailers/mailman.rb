class Mailman < ActionMailer::Base

  def contact(message)
    @message_body = message.body 
    mail :to => 'hola@alabs.es', :from => "#{message.name} <#{message.email}>", :subject => message.subject
  end
end
