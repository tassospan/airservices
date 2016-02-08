class WelcomesController < ApplicationController
  before_action :find_welcome, only: [:edit, :update]
  
  def index
    @welcomes = Welcome.all
    @socials = Social.all
  end
 
  def edit
  end
  
  def update
    if @welcome.update(welcome_params)
      redirect_to '/welcomes/'
    else
      render 'edit'
    end
  end
  
  private
  
  def find_welcome
    @welcome = Welcome.find(params[:id])
  end
  
  def welcome_params
    params.require(:welcome).permit(:title, :body, :user_id)
  end
  
end
