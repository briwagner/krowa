require 'http'

class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def parse_xml(url)
    #creates a hash with game ids as keys and game names as values
    doc = Nokogiri::XML(open(url))
    ids = doc.css("boardgame").map { |node| node.attr("objectid").to_s }
    names = doc.css("name").map { |node| node.children.text }
    game_info = []
    counter = 0
    names.each do |name|
      game_info << { ids[counter] => name }
      counter +=1
    end
    return game_info
  end

  def fix_search_words(words)
    new_string = words.gsub(/\s/, '+')
  end

  def parse_game_data(api_id)
    url = "http://boardgamegeek.com/xmlapi/boardgame/#{api_id}"
    doc = Nokogiri::XML(open(url))
    p "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
    name = doc.css("name").children.text
    min_players = doc.css("minplayers").children.text
    max_players = doc.css("maxplayers").children.text
    year_published = doc.css("yearpublished").children.text
    playing_time = doc.css("playingtime").children.text
    image_url = doc.css("image").children.text
    description = doc.css("description").children.text
    p @game_data = {name: name, min_players: min_players, max_players: max_players, year_published: year_published, playing_time: playing_time, image_url: image_url, description: description}
  end

end
