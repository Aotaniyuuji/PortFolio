class Game < ApplicationRecord
  has_many :reviews, dependent: :destroy

  belongs_to :genre

  has_one_attached :image

  validates :name, presence: true, length: {maximum: 50}, uniqueness: true
  validates :explanation, presence: true
end
