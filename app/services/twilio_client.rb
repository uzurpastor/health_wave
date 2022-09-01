class TwilioClient

  def initialize
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send_to(user, message)
    @client.messages.create(
      to: user.phone,
      from: phone_number,
      body: message) 
  end

  private
    def account_sid
      Rails.application.credentials.twilio.account_sid
    end

    def auth_token
      Rails.application.credentials.twilio.auth_token
    end

    def phone_number
      Rails.application.credentials.twilio.phone_number
    end
end