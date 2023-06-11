class Admin::GamesController < ApplicationController
  def new
    @game = Game.new
  end
  def create
    @game = Game.new(game_params)
    @game.save
    redirect_to admin_game_path(@game.id)
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
    params.require(:game).permit(:name,:explanation)
  end
end
