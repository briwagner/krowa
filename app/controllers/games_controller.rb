class GamesController < ApplicationController

  def index
    @games = Game.all
    if params[:name].present?
      @games = Game.search(params[:name])
    end
  end

  def show
    @game = Game.find(params[:id])
    @reviews = @game.reviews.order('created_at DESC')
    if params[:name].present?
      search_words = fix_search_words(params[:name])
      parse_xml_titles("http://www.boardgamegeek.com/xmlapi/search?search=#{search_words}")
    end
  end

  def add_index
    if params[:name].present?
      search_words = fix_search_words(params[:name])
      @game_data = parse_xml_titles("http://www.boardgamegeek.com/xmlapi/search?search=#{search_words}")
    end
  end

  def add
    parse_game_data(params[:api_id])
  end

  def add_create
  end

end
