class GamesController < ApplicationController
  helper_method :sort_column, :sort_direction
  include ApplicationHelper

  def index
    if params[:sort] == "popularity"
      return @games = Game.all.sort_by {|game| game.average_score}.reverse
    end
      @games = Game.order(sort_column + " " + sort_direction)
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
    parse_game_data(params[:api_id])
  end

  def add_create
  end

  private 

  def sort_column
    params[:sort] || "name"
  end

  def sort_direction
    params[:direction] || "asc"
  end

end
