class SendTextController < ApplicationController
  def trigger_sms_message
    account_sid = ENV["twilio_account_sid"]
    auth_token = ENV["twilio_auth_token"]
     
    @client = Twilio::REST::Client.new account_sid, auth_token 
     
    @client.account.messages.create({
      :from => '+13123130370', 
      :to => '+13128524472', 
      :body => 'Hello',  
    }) 

    redirect_to "/recipes"
  end
end
