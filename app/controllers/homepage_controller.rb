class HomepageController < ApplicationController
  def index
    @campaign = Campaign.find(1)
    @date = Time.zone.today
    @locations = @campaign.locations.limit(3)
    @log_entries = @campaign.log_entries.ic_anti_chronological.oc_anti_chronological.limit(3)
    @nonplayer_characters = @campaign.nonplayer_characters.limit(3)
    @player_characters = @campaign.player_characters
  end
end
