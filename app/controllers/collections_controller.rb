class CollectionsController < ApplicationController

  def create
    collection = Collection.new(user: current_user, game: Game.find(params[:game_id]))
    if collection.save
      redirect_to game_path(Game.find(params[:game_id]))
    end
  end

  def delete
    collection = Collection.find(params[:id])
    collection.destroy
  end
end
