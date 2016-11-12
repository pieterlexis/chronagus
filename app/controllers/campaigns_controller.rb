class CampaignsController < ApplicationController
  before_filter :set_campaign, only: [:show, :edit, :update]

  def show
    authorize @campaign

    @locations = @campaign.locations.limit(3)
    @log_entries = @campaign.log_entries.ic_anti_chronological.oc_anti_chronological.limit(3)
    @nonplayer_characters = @campaign.nonplayer_characters.limit(3)
    @player_characters = @campaign.player_characters
  end

  def new
    @campaign = Campaign.new
    authorize @campaign
  end

  def create
    @campaign = Campaign.new(campaign_params)
    authorize @campaign

    @campaign.game_master = current_user

    if @campaign.save
      redirect_to @campaign
    else
      render :new
    end
  end

  def edit
    authorize @campaign

    @available_players = User.where.not(id: @campaign.members.pluck(:id))
  end

  def update
    authorize @campaign

    initial_gm = @campaign.game_master

    if @campaign.update(campaign_params)
      unless @campaign.game_master == initial_gm
        @campaign.players << initial_gm
        @campaign.campaigns_players.find_by(user_id: @campaign.game_master_id).destroy
      end

      redirect_to campaign_path(@campaign)
    else
      render :edit
    end
  end

  private

  def campaign_params
    params.require(:campaign).permit(:name, :game_master_id)
  end

  def set_campaign
    @campaign = Campaign.find(params[:id])
  end
end
