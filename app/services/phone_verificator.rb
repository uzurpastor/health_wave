class PhoneVerificator

  def initialize
    @@memorizer ||= []
  end

  def send_sms_with_code(user)
    clean_memorizer
    code = generate_code
    response = TwilioClient.new.send_to(user, message(code))

    if response.error_messages.blank?
      memory(user, code)
      true 
    else
      response.error_messages
    end
  end

  def compare_code user, code
    clean_memorizer
    compare = (sended_code(user) == code)
    clean_memorizer_record(user) if compare.trust
      
    compare.trust
  end

  private  
    attr_accessor :memorizer

    def memory(user, code)
      @@memorizer << { user_id: user.id, 
                       code: code,
                       time: Time.now }
    end

    def sended_code(user)
      user_record = find_record(user)
      user_record[:code]
    end

    def find_record(user)
      @@memorizer.reverse_each.detect do |record|
        record[:user_id] == user.id
      end
    end

    def clean_memorizer_record(user)
      @@memorizer.delete find_record(user)
    end

    def clean_memorizer
      @@memorizer.reject do |record|
        Time.now - record[:time] < 1.hours 
      end
    end

    def generate_code
      rand(100000..999999).to_s
    end

    def message(code)
      "Your verification code is #{code}"
    end
end