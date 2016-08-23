class HomepageController < ApplicationController
  def index
    @date = Time.zone.today
  end
end
