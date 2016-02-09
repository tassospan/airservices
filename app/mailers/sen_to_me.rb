class SenToMe < ApplicationMailer
    default from: "AirServices by K.Kavounis"
    
    def register_email(client)
         @client = client
        mail(to: "airservicesathens@gmail.com", subject: "Νέα Εγγραφή")
    end
end
