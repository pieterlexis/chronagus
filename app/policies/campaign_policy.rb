class CampaignPolicy < ApplicationPolicy
  def create?
    return false unless @user
    true
  end

  def show?
    @record.member?(@user)
  end

  def update?
    @record.game_master_id == @user.id
  end

  def destroy?
    false #campaigns cannot be destroyed for now
  end
end
