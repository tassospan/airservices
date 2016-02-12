class PropertiesController < ApplicationController
    http_basic_authenticate_with name: Rails.application.secrets.name, password: Rails.application.secrets.password
    before_action :find_property, only: [:show, :edit, :update, :destroy]
  
  def index
    @properties = Property.paginate(:page => params[:page])
  end
  
  def show
  end
  
  def new
  @property = Property.new
  end
  
  def create
      @property = Property.new(property_params)
      if @property.save
          redirect_to @property
      else
          render 'new'
      end
  end
 
  def edit
  end
  
  def update
    if @property.update(property_params)
      redirect_to @property 
    else
      render 'edit'
    end
  end
  
  def destroy
      @property.destroy
      redirect_to properties_path
  end
  
  private
  
  def find_property
    @property = Property.find(params[:id])
  end
  
  def property_params
    params.require(:property).permit(:name, :image_link)
  end
  
end