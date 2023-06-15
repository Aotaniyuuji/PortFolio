class Public::GamesController < ApplicationController
  def index
    @genres = Genre.all
    if Game.where(genre_id: params[:genre_id])
      @games = Game.where(genre_id: params[:genre_id])
    else
      @games = Game.all
    end
  end

  def show
    @game = Game.find(params[:id])
    @reviews = Review.all
    @review = Review.new
  end
end
