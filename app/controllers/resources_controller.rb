class ResourcesController < ApplicationController
  layout "admin"
  before_action :set_resource, only: [:edit, :update, :destroy]

  def index
    @active_resources = Resource.where(active: true)
    @inactive_resources = Resource.where(active: false)
  end

  def new
    @resource = Resource.new
  end

  def create
    binding.pry
    @resource = Resource.new(resource_params)
    @resource.filename = params[:resource][:resource].original_filename

    uploaded_io = params[:resource][:resource]
    File.open(Rails.root.join('public', 'resources', uploaded_io.original_filename), 'wb') do |file|
      file.write(uploaded_io.read)
    end
    
    if @resource.save
      flash[:notice] = "Resource uploaded"
      redirect_to resources_path
    else
      flash[:danger] = "There was an error"
      render :new
    end
  end

  def edit
  end

  def update
    if @resource.update(resouce_params)
      flash[:notice] = "Resource updated"
      redirect_to resources_path
    else
      flash[:danger] = "There was an error"
      render :edit
    end
  end

  def destroy
    File.delete(Rails.root.join('public', 'resources', @resource.filename))
    flash[:notice] = "#{@resource.name} destroyed."
    @resource.destroy
    redirect_to resources_path
  end

  private

  def set_resource
    @resource = Resource.find(params[:id])
  end

  def resource_params
    params.require(:resource).permit(:name, :description, :active)
  end

end