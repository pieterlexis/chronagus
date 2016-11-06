class HomepageController < ApplicationController
  def index
    @pc_campaigns = current_user.campaigns
    @gm_campaigns = current_user.gm_campaigns
  end
end
