class Game < ApplicationRecord
  has_many :reviews, dependent: :destroy

  belongs_to :genre
end
