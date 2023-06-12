class Game < ApplicationRecord
  has_many :reviews, dependent: :destroy

  belongs_to :genre

  validates :name, presence: true, length: {maximum: 50}, uniqueness: true
  validates :explanation, presence: true
end
