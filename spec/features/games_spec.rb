
require 'rails_helper'

feature "User views games page" do
  let!(:game) { Game.create!({:name=>"Where in the World is Carmen Sandiego?", :api_id=>8009, :description=>"Players answer trivia questions to move around the world.  By catching henchmen players can deduce where Carmen Sandiego is located and win the game.", :image_url=>"//cf.geekdo-images.com/images/pic42110.jpg", :thumbnail_url=>"//cf.geekdo-images.com/images/pic42110_t.jpg", :min_players=>2, :max_players=>6, :playing_time=>60}) }


  scenario "User visits game page and views games in our database" do
    visit '/games'
    expect(page).to have_text("Where in the World is Carmen Sandiego?")
    expect(page).to have_css("img[src*='//cf.geekdo-images.com/images/pic42110_t.jpg']")
  end


end
