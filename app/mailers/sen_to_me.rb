class SenToMe < ApplicationMailer
    default from: "AirServices by K.Kavounis"
    
    def register_email(client)
         @client = client
        mail(to: "info@fifart.net", subject: "New Registration")
    end
end
