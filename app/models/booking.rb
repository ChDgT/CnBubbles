class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :comic
  validates :comic_id, uniqueness: { scope: :user_id }
end
