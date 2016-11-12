class LogEntryPolicy < ApplicationPolicy
  def show?
    @record.campaign.member?(@user)
  end

  def create?
    @record.campaign.member?(@user)
  end

  def update?
    @record.campaign.member?(@user)
  end

  def destroy?
    @record.campaign.member?(@user)
  end
end
