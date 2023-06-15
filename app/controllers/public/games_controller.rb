class Public::GamesController < ApplicationController
  def index
    @genres = Genre.all
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
    @reviews = Review.all
    @review = Review.new
  end

  def bygenre_game
    @genres = Genre.all
    @game = Genre.where(name: "RPG")
    @games = Game.all
  end

end
