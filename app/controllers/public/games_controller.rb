class Public::GamesController < ApplicationController
  def index
    @genres = Genre.all
# 絞り込み条件によって条件分岐
    @games = Game.all

    if Game.where(genre_id: params[:genre_id])
      @games = Game.where(genre_id: params[:genre_id])
    end
  end

  def show
    @genres = Genre.all
    @game = Game.find(params[:id])
    @reviews = Review.all
    @review = Review.new
  end
end
