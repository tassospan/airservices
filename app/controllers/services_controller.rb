class ServicesController < ApplicationController
    http_basic_authenticate_with name: Rails.application.secrets.name, password: Rails.application.secrets.password
    before_action :find_service, only: [:show, :edit, :update, :destroy]
  
  def index
    @services = Service.all
    @categories = Category.all
  end
  
  def show
  end
  
  def new
  @service = Service.new
  end
  
  def create
      @service = Service.new(service_params)
      if @service.save
          redirect_to @service
      else
          render 'new'
      end
  end
 
  def edit
  end
  
  def update
    if @service.update(service_params)
      redirect_to @service 
    else
      render 'edit'
    end
  end
  
  def destroy
      @service.destroy
      redirect_to services_path
  end
  
  private
  
  def find_service
    @service = Service.find(params[:id])
  end
  
  def service_params
    params.require(:service).permit(:title, :price, :category_id)
  end
end
