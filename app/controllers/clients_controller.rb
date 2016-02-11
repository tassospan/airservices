class ClientsController < ApplicationController
   http_basic_authenticate_with name: ENV["SITE_USERNAME"], password: ENV["SITE_PASSWORD"], except: [:new, :create]
    before_action :find_client, only: [:show, :edit, :update, :destroy]
  
  def index
    @clients = Client.all
  end
  
  def show
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
 
  def edit
  end
  
  def update
    if @client.update(client_params)
      redirect_to @client 
    else
      render 'edit'
    end
  end
  
  def destroy
  @client.destroy
  redirect_to clients_path
  end
  
  private
  
  def find_client
    @client = Client.find(params[:id])
  end
  
  def client_params
    params.require(:client).permit(:name, :surname, :email, :phone, :address, :floor, :message)
  end
  
end
