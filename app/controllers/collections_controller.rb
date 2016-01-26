class CollectionsController < ApplicationController

  def create
    collection = Collection.new(user: session[:user_id], game: Game.find(params[:game_id])
    collection.save
  end

  def delete
    collection = Collection.find(params[:id])
    collection.destroy
  end
end
