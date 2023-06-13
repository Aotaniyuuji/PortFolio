class Public::SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @games = Game.looks(params[:search], params[:word])
  end
end
