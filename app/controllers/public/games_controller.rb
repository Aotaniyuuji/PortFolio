class Public::GamesController < ApplicationController

  def index
    @genres = Genre.all
# 絞り込み条件によって条件分岐
    if params[:genre_id]
      @games = Game.where(genre_id: params[:genre_id]).page(params[:page]).per(5)
# ソート機能による並び替え
    elsif params[:latest]
      @games = Game.latest.page(params[:page]).per(5)
    elsif params[:old]
      @games = Game.old.page(params[:page]).per(5)
    elsif params[:star_count]
      @games = Kaminari.paginate_array(Game.star_count).page(params[:page]).per(5)
    else
      @games = Game.page(params[:page]).per(5)
    end
  end

  def show
    @genres = Genre.all
    @game = Game.find(params[:id])
    @reviews = Review.all
    @review = Review.new
  end
end
