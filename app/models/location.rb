class Location < ActiveRecord::Base
  belongs_to :campaign
  belongs_to :area, class_name: 'Location', foreign_key: :location_id
  has_many :sections, class_name: 'Location', foreign_key: :location_id

  scope :recent, -> { order(updated_at: :desc) }
  scope :alphabetical, -> { order(name: :asc) }
end
