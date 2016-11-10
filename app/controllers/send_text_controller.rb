class SendTextController < ApplicationController
  def trigger_sms_message
    @alert_message = "Testing!"

    user_phone_number = current_user.phone
    send_message(user_phone_number, @alert_message)

    redirect_to '/recipes'
  end

  private

  def send_message(user_phone_number, alert_message)
    @twilio_phone_number = ENV['twilio_phone_number']

    @client = Twilio::REST::Client.new ENV['twilio_account_sid'], ENV['twilio_auth_token']
    
    message = @client.account.messages.create(
      :from => "3123130370",
      :to => "3128524472",
      :body => "hello"
    )
    puts message.to
  end
end
