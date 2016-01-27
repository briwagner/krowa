class TaggingsController < ApplicationController

  def create
    tagging = Tagging.new(game_id: params[:game_id], tag_id: params[:id] )
    if tagging.save
      redirect_to game_path(Game.find(params[:game_id]))
    end
  end

  def destroy
    tagging = Tagging.find_by(game_id: params[:game_id], tag_id: params[:id] )
    if tagging.destroy
      redirect_to game_path(Game.find(params[:game_id]))
    end
  end

end
