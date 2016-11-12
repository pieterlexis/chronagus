class PlayerCharacterPolicy < ApplicationPolicy
  def show?
    @record.campaign.member?(@user)
  end

  def create?
    @record.campaign.member?(@user)
  end

  def update?
    @record.player_id == @user.id
  end

  def destroy?
    @record.player_id == @user.id
  end
end
