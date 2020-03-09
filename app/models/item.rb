class Item < ApplicationRecord
  belongs_to :user,optional: true
  has_many :images
  # mount_uploader :image, ImageUploader
  belongs_to :category
end
