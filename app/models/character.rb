class Character < ApplicationRecord
  include AvatarUploader[:avatar]

  validates :name, :campaign, presence: true
  belongs_to :campaign

  scope :recent, -> { order(updated_at: :desc) }
  scope :alphabetical, -> { order(name: :asc) }
  scope :active, -> { where(active: true) }
end
