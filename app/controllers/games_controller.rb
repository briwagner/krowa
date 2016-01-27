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
    @game_data = parse_game_data(params[:api_id])
    flash[:game_data] = @game_data
  end

  def add_create
    if flash[:game_data]
      game = Game.new(flash[:game_data])
      if game.save
        redirect_to games_path
      end
    end
  end

end
