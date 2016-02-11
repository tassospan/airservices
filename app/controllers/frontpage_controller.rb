class FrontpageController < ApplicationController
    http_basic_authenticate_with name: ENV["SITE_USERNAME"], password: ENV["SITE_PASSWORD"], except: [:index, :new, :create]
    def index
        @box_one = Welcome.first
        @box_two = Welcome.second
        @box_three = Welcome.last
        @social = Social.first
        @services = Service.all
        @service_list = @services.order('price DESC').group_by { |t| t.category.name }
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
