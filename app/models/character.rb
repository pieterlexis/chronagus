class Character < ActiveRecord::Base
  validates :name, :campaign, :player, presence: true
  belongs_to :campaign
end
