class Review < ApplicationRecord
  belongs_to :user
  belongs_to :game

  validates :title, presence: true, length: {maximum: 20}
  validates :comment, presence: true, length: {maximum: 200}
  validates :star, presence: true
end
