class Public::SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @game = Game.looks(params[:search], params[:word])
  end
end
