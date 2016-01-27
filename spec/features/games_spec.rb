
require 'rails_helper'

feature "Games page" do
  #let is lazy evaluated. "let!" creates variable no matter what
  let!(:game) { Game.create!({:name=>"Where in the World is Carmen Sandiego?", :api_id=>8009, :description=>"Players answer trivia questions to move around the world.  By catching henchmen players can deduce where Carmen Sandiego is located and win the game.", :image_url=>"//cf.geekdo-images.com/images/pic42110.jpg", :thumbnail_url=>"//cf.geekdo-images.com/images/pic42110_t.jpg", :min_players=>2, :max_players=>6, :playing_time=>60}) }
  let!(:user) { User.create(firstname: "bob", lastname: "bob", email: "bob@bob.com", password: "bob") }

  scenario "User visits game page and views games in our database" do
    visit '/games'
    expect(page).to have_text("Where in the World is Carmen Sandiego?")
    expect(page).to have_css("img[src*='//cf.geekdo-images.com/images/pic42110_t.jpg']")
  end

  scenario "User can't add game to their collection if they're not logged in" do
    visit "/games/#{game.id}"
    expect(page).to_not have_css("input[value='Add to collection']")
  end

  scenario "User can add game to their collection if they're logged in" do
    visit "/login"
    within('#main-content form') do
      fill_in 'email', :with => 'bob@bob.com'
      fill_in 'password', :with => 'bob'
    end
    click_button 'Login'

    visit "/games/#{game.id}"
    save_and_open_page
    expect(page).to have_css("input[value='Add to collection']")
  end


end
