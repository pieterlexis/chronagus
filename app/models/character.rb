class Character < ActiveRecord::Base
  include Bootsy::Container
  include AvatarUploader[:avatar]

  validates :name, :campaign, presence: true
  belongs_to :campaign
end
