class LocationsController < ApplicationController
  before_filter :set_location, only: [:show, :edit, :update]
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

  private

  def set_location
    @location = Location.find(params[:id])
  end

  def set_campaign
    @campaign = Campaign.find(params[:campaign_id])
  end

  def location_params
    input_params = params.require(:location).permit(:name, :public_description, :campaign_id)
    sanitize_input(input_params, [:name, :public_description])
    input_params
  end
end
