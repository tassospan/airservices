class SocialsController < ApplicationController
    http_basic_authenticate_with name: Rails.application.secrets.name, password: Rails.application.secrets.password
    before_action :find_social, only: [:edit, :update]
    
  def edit
  end
  
  def update
    if @social.update(social_params)
      redirect_to '/welcomes/'
    else
      render 'edit'
    end
  end
  
  private
  
  def find_social
    @social = Social.find(params[:id])
  end
  
  def social_params
    params.require(:social).permit(:facebook, :phone)
  end
  


end
