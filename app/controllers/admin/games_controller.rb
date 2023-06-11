class Admin::GamesController < ApplicationController
  def index
  end
  
  def create
  end
  
  def show
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
  private
  
  def game_params
    params.require(:game).permit()
  end
end
