class Public::GamesController < ApplicationController
  def index
    @genres = Genre.all
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
    @review = Review.new
  end

  def bygenre_game
    @genres = Genre.all
    @game = Genre.where(name: "RPG")
  end
end
