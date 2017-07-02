class LogEntry < ActiveRecord::Base
  include Bootsy::Container

  belongs_to :campaign
  scope :ic_chronological, -> { order(ic_date: :asc) }
  scope :ic_anti_chronological, -> { order(ic_date: :desc) }
  scope :oc_anti_chronological, -> { order(oc_date: :desc) }

  after_save :update_campaign_date

  private

  def update_campaign_date
    campaign.update_current_date
  end
end
