class SendTextController < ApplicationController
  def trigger_sms_message
    account_sid = ENV["twilio_account_sid"]
    auth_token = ENV["twilio_auth_token"]
    twilio_phone = ENV["twilio_phone_number"]
     
    @client = Twilio::REST::Client.new account_sid, auth_token 
     
    @client.account.messages.create({
      from: twilio_phone, 
      to: params[:to], 
      body: "Here are the ingredients your are missing:  #{params[:body]}"
    }) 

    redirect_to "/recipes"
  end
end
