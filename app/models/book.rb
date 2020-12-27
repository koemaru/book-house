class Book < ApplicationRecord

  mount_uploader :image, ImageUploader
  belongs_to :category
  belongs_to :user
  has_many :likes

end
