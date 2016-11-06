class CampaignsController < ApplicationController
  before_filter :set_campaign, only: [:show]

  def show
    @locations = @campaign.locations.limit(3)
    @log_entries = @campaign.log_entries.ic_anti_chronological.oc_anti_chronological.limit(3)
    @nonplayer_characters = @campaign.nonplayer_characters.limit(3)
    @player_characters = @campaign.player_characters
  end

  def new
    @campaign = Campaign.new
  end

  def create
    @campaign = Campaign.new(campaign_params)
    @campaign.game_master = current_user

    if @campaign.save
      redirect_to @campaign
    else
      render :new
    end
  end

  private

  def campaign_params
    params.require(:campaign).permit(:name)
  end

  def set_campaign
    @campaign = Campaign.find(params[:id])
  end
end
