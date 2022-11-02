class LocationsController < ApplicationController
  before_action :set_location, only: %i[show edit update destroy]
  before_action :hidden, only: %i[index]
  before_action :hidden_articles
  http_basic_authenticate_with name: 'admin', password: 'admin', except: :show # sets up authentication for the admin tool except in the loocations#show

  def index
    @locations = Location.all
  end

  def show; end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    if @location.save
      redirect_to location_path(@location), notice: 'Location successfully created'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @location.update(location_params)
      redirect_to location_path(@location), notice: 'Location was successfully updated'
    else
      render :edit
    end
  end

  def destroy
    @location.destroy
    redirect_to locations_url, notice: 'Location was successfully destroyed', status: :see_other
  end

  private

  def set_location
    @location = Location.find(params[:id])
  end

  def location_params
    params.require(:location).permit(:title, :subtitle, :header_image, :description)
  end

  def hidden
    @hide_header = true
    @hide_poster = true
    @hide_description = true
  end

  def hidden_articles
    @hide_articles = true
  end
end
