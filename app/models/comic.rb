class Comic < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, allow_blank: false
  validates :description, presence: true, allow_blank: false
  validates_numericality_of :price, greater_than: 0
  mount_uploader :photo, PhotoUploader
  validates :publication_date, inclusion: {in: (1899..Time.now.to_a[5]), message: "%{value} really ??"}, allow_blank: true
end
