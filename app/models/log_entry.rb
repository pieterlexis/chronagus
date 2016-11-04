class LogEntry < ActiveRecord::Base
  belongs_to :campaign
  scope :ic_anti_chronological, -> { order(ic_date: :desc) }

  after_save :update_campaign_date

  private

  def update_campaign_date
    campaign.update_current_date
  end
end
