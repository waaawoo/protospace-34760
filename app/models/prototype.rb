class Prototype < ApplicationRecord

  # バリデーション
  validates :title, presence: true
  validates :catch_copy, presence: true
  validates :concept, presence: true
  validates :image, presence: true
  # アソシエーション
  belongs_to :user
  # プロトタイプが削除されたコメントも削除するdependent: :destory
  has_many :comments, dependent: :destroy
  # image登録用
  has_one_attached :image
end
