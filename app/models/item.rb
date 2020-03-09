class Item < ApplicationRecord
  belongs_to :user,optional: true
  has_many :images
  accepts_nested_attributes_for :images
  belongs_to :category,optional: true
end
