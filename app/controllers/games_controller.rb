class GamesController < ActionController::Base

  def index
    @games = Game.all
  end

end
