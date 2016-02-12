class FrontpageController < ApplicationController
    http_basic_authenticate_with name: Rails.application.secrets.name, password: Rails.application.secrets.password, except: [:index, :new, :create]
    def index
        @box_one = Welcome.first
        @box_two = Welcome.second
        @box_three = Welcome.third
        @box_four = Welcome.last
        @social = Social.first
        
        @property = Property.first
        @properties = Property.limit(5).where("id > 1")
    end
    
    def new
        @client = Client.new
    end
  
    def create
        @client = Client.new(client_params)
        if @client.save
        MyMailer.welcome_email(@client).deliver
        SenToMe.register_email(@client).deliver
        redirect_to root_path, notice: 'Ευχαριστούμε για την Εγγραφή σας'
        else
        render 'new'
        end
    end
    
    private
  
    def client_params
        params.require(:client).permit(:name, :surname, :email, :phone, :address, :floor, :message)
    end
    
end
