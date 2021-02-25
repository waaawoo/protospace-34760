class Prototype < ApplicationRecord

  # バリデーション
  validates :title, presence: true
  validates :catch_copy, presence: true
  validates :concept, presence: true
  # アソシエーション
  belongs_to :user
end
