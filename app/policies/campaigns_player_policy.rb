class CampaignsPlayerPolicy < ApplicationPolicy
  def create?
    @record.campaign.game_master_id == @user.id
  end

  def destroy?
    @record.campaign.game_master_id == @user.id
  end
end
