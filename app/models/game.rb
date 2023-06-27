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
    averages = Game.all.map {|game| { id: game.id, ave: game.reviews.average(:star).to_f.round(1)}}
    sort_averages = averages.sort { |a, b| b[:ave] <=> a[:ave] }
    sort_ids = sort_averages.map { |ave| ave[:id] }
    Game.find(sort_ids).sort_by{ |o| sort_ids.index(o.id)}
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
