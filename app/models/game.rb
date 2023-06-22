class Game < ApplicationRecord
  has_many :reviews, dependent: :destroy

  belongs_to :genre

  has_one_attached :image

  validates :name, presence: true, length: {maximum: 50}, uniqueness: true
  validates :explanation, presence: true

  scope :latest, -> {order(created_at: :desc)}
  scope :old, -> {order(created_at: :asc)}
  scope :star_count, -> {order(star: :desc)}

  def self.looks(search, word)
    if search == "perfect_match"
      @game = Game.where("name LIKE?","#{word}")
    elsif search == "partial_match"
      @game = Game.where("name LIKE?","%#{word}%")
    else
      @game = Game.all
    end
  end
end
