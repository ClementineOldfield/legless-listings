class Listing < ApplicationRecord
  belongs_to :breed
  enum sex: { female: 0, male: 1 }
  validates :title, :description, :breed_id, :sex, :price, :deposit, :date_of_birth, presence:true
  has_one_attached :picture
  belongs_to :user
end