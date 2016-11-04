class Character < ActiveRecord::Base
  validates :name, :campaign, presence: true
  belongs_to :campaign
end
