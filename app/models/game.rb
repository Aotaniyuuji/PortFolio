class Game < ApplicationRecord
  has_many :reviews, dependent: :destroy

  belongs_to :genre

  has_one_attached :image

  validates :name, presence: true, length: {maximum: 50}, uniqueness: true
  validates :explanation, presence: true

  scope :latest, -> {order(created_at: :desc)}
  scope :old, -> {order(created_at: :asc)}
  # scope :star_count, -> { joins(:reviews).order('reviews.star desc') }

  def self.star_count
    game_ids = Review.all.group_by(&:game_id).map { |k, v|
      stars = v.pluck(:star)
      v = stars.sum / stars.size
      { k => v}
    }.sort_by { |_, v| v }.map(&:keys).flatten

    games = game_ids.map { |id_hash| Game.find(id_hash) }
  end

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
