class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :address, presence: true, uniqueness: true, length: { minimum: 10 }
  validates :category, presence: true, inclusion: { in: %w[chinese italian japanese french belgian] }
  validates_associated :reviews
end
