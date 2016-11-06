class Character < ActiveRecord::Base
  include Bootsy::Container

  validates :name, :campaign, presence: true
  belongs_to :campaign
end
