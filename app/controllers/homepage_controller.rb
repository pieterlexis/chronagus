class HomepageController < ApplicationController
  def index
    @campaign = Campaign.find(1)
    @date = Time.zone.today
  end
end
