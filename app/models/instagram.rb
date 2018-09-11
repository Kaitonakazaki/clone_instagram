class Instagram < ApplicationRecord
  validates :title, presence: true
  has_many :favorites,dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  belongs_to :user
  mount_uploader :image, ImageUploader
end
