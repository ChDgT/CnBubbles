class Comic < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, allow_blank: false
  validates :description, presence: true, allow_blank: false
  validates :category, presence: true, allow_blank: false
  validates_numericality_of :price, greater_than: 0
  mount_uploader :photo, PhotoUploader
end
