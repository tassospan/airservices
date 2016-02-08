class MyMailer < ApplicationMailer
    default from: "AirServices by K.Kavounis"
    
    def welcome_email(client)
        @client = client
        mail(to: @client.email, subject: "Welcome to AirServices")
    end
end
