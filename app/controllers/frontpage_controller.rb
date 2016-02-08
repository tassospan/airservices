class FrontpageController < ApplicationController
    before_action :find_client, only: [:show, :edit, :update, :destroy]
    
    def index
        @box_one = Welcome.first
        @box_two = Welcome.second
        @box_three = Welcome.last
        @social = Social.first
    end
    
    def new
        @client = Client.new
    end
  
    def create
        @client = Client.new(client_params)
        if @client.save
        MyMailer.welcome_email(@client).deliver
        redirect_to root_path
        else
        render 'new'
        end
    end
    
    private
  
    def find_client
        @client = Client.find(params[:id])
    end
  
    def client_params
        params.require(:client).permit(:name, :surname, :email, :phone, :address, :floor, :message)
    end
    
end
