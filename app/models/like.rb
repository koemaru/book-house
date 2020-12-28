class Like < ApplicationRecord

  belongs_to :user
  belongs_to :book

  # いいねは一人一回のみ
  validates_uniqueness_of :book_id, scope: :user_id
  
end
