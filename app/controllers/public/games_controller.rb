class Public::GamesController < ApplicationController
  def index
    @genres = Genre.all
# 絞り込み条件によって条件分岐
    if params[:genre_id]
      @games = Game.where(genre_id: params[:genre_id])
    else
      @games = Game.page(params[:page])
    end
  
# ソート機能による並び替え
    if params[:latest]
      @games = Game.latest
    elsif params[:old]
      @games = Game.old
    elsif params[:star_count]
      @games = Game.star_count
    else
      @games = Game.all
    end
  end

  def show
    @genres = Genre.all
    @game = Game.find(params[:id])
    @reviews = Review.all
    @review = Review.new
  end
end
