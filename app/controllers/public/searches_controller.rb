class Public::SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @range = params[:range]
    if @range == "Game"
      @game = Game.looks(params[:search], params[:word])
    end
  end

  def result
  end
end
