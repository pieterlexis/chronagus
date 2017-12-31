class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy]
  before_action :set_campaign, only: [:index, :new]

  def index
    authorize @campaign, :show?

    @locations = @campaign.locations.alphabetical
  end

  def show
    authorize @location
  end

  def new
    @location = Location.new(campaign: @campaign)
    authorize @location
  end

  def create
    @location = Location.new(location_params)
    authorize @location

    if @location.save
      redirect_to location_path(@location)
    else
      render :new
    end
  end

  def edit
    authorize @location
  end

  def update
    authorize @location

    if @location.update(location_params)
      redirect_to location_path(@location)
    else
      render :edit
    end
  end

  def destroy
    authorize @location

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
      .permit(:name, :public_description, :campaign_id)
  end
end
