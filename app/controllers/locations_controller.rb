class LocationsController < ApplicationController
  before_filter :set_location, only: [:show, :edit, :update, :destroy]
  before_filter :set_campaign, only: [:index, :new]

  def index
    @locations = @campaign.locations
  end

  def show
  end

  def new
    @location = Location.new(campaign: @campaign)
  end

  def create
    @location = Location.new(location_params)

    if @location.save
      redirect_to location_path(@location)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @location.update(location_params)
      redirect_to location_path(@location)
    else
      render :edit
    end
  end

  def destroy
    @location.destroy
    redirect_to campaign_locations_path(@location.campaign)
  end

  private

  def set_location
    @location = Location.find(params[:id])
  end

  def set_campaign
    @campaign = Campaign.find(params[:campaign_id])
  end

  def location_params
    params
      .require(:location)
      .permit(:name, :public_description, :campaign_id, :bootsy_image_gallery_id)
  end
end
