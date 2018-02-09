class CampaignsPlayersController < ApplicationController
  def create
    campaigns_player = CampaignsPlayer.new(campaigns_player_params)
    authorize campaigns_player

    campaigns_player.save

    redirect_to edit_campaign_path(@campaign)
  end

  def destroy
    campaigns_player = CampaignsPlayer.find_by(id: params[:id])
    authorize campaigns_player

    campaigns_player.destroy

    redirect_to edit_campaign_path(@campaign)
  end

  private

  def campaigns_player_params
    params.require(:campaigns_player).permit(:user_id, :campaign_id)
  end
end
