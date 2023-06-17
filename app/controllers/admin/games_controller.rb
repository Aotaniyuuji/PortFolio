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
    game = Game.find(params[:id])
    if game.update(game_params)
      flash[:success] = "編集に成功しました"
      redirect_to admin_game_path(game)
    else
      flash[:danger] = "編集に失敗しました"
      render :edit
    end
  end

  def destroy
  end

  private

  def game_params
    params.require(:game).permit(:name,:explanation,:genre_id)
  end
end
