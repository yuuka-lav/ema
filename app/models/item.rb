class Item < ApplicationRecord
  belongs_to :user
  has_many :images
  mount_uploader :image, ImageUploader
end
