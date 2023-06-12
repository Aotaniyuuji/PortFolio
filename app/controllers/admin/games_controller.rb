class Admin::GamesController < ApplicationController
  def new
    @game = Game.new
  end
  def create
    @game = Game.new(game_params)
    if @game.save
      redirect_to admin_game_path(@game.id)
    else
      redirect_to admin_games_path
    end
  end

  def index
    @games = Game.all
    @game = Game.new
  end

  def show
    @game = Game.find(params[:id])
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private

  def game_params
    params.require(:game).permit(:name,:explanation,:genre_id)
  end
end
