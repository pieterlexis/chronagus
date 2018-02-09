class ApplicationController < ActionController::Base
  include ApplicationHelper
  include Pundit
  before_action :authenticate_user!, :set_campaign

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def set_campaign
    return unless params[:campaign_id]
    @campaign = Campaign.find(params[:campaign_id])
  end
end
