require 'http'

class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def parse_xml_titles(url)
    #creates an array of hashes with game ids and game names as values
    doc = Nokogiri::XML(open(url))
    ids = doc.css("boardgame").map { |node| node.attr("objectid").to_s }
    names = doc.css("name").map { |node| node.children.text }
    game_info = []
    counter = 0
    names.each do |name|
      game_info << { id: ids[counter], name: name }
      counter +=1
    end
    return game_info
  end

  def fix_search_words(words)
    new_string = words.gsub(/\s/, '+')
  end

end
