class List < ApplicationRecord
  belongs_to :user
  has_many :list_items
  has_many :games, through: :list_items
  validates :list_type, inclusion: { in: %w(favorites wishlist played),
    message: "%{value} is not a valid list type" }
  validates :visibility, inclusion: { in: %w(public friends private),
    message: "%{value} is not a valid visibility type" }
end
