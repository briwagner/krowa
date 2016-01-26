class GamesController < ApplicationController

  def index
    @games = Game.all
    if params[:name].present?
      @games = Game.search(params[:name])
    end
  end

  def show
    @game = Game.find(params[:id])
  end

end
