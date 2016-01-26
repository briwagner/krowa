class GamesController < ApplicationController

  def index
    @games = Game.all
    if params[:name].present?
      @games = Game.search(params[:name])
    end
  end

  def show
    @game = Game.find(params[:id])
    if params[:name].present?
      search_words = fix_search_words(params[:name])
      parse_xml("http://www.boardgamegeek.com/xmlapi/search?search=#{search_words}")
    end
  end

  def add
    if params[:name].present?
      search_words = fix_search_words(params[:name])
      game_data = parse_xml("http://www.boardgamegeek.com/xmlapi/search?search=#{search_words}")
    end
  end
end
