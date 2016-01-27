
require 'rails_helper'

feature "Games index page" do
  #let is lazy evaluated. "let!" creates variable no matter what
  let!(:game) { Game.create!({:name=>"Where in the World is Carmen Sandiego?", :api_id=>8009, :description=>"Players answer trivia questions to move around the world.  By catching henchmen players can deduce where Carmen Sandiego is located and win the game.", :image_url=>"//cf.geekdo-images.com/images/pic42110.jpg", :thumbnail_url=>"//cf.geekdo-images.com/images/pic42110_t.jpg", :min_players=>2, :max_players=>6, :playing_time=>60}) }
  let!(:user) { User.create(firstname: "bob", lastname: "bob", email: "bob@bob.com", password: "bob") }

  scenario "User visits game page and views games in our database" do
    visit '/games'
    expect(page).to have_text("Where in the World is Carmen Sandiego?")
    expect(page).to have_css("img[src*='//cf.geekdo-images.com/images/pic42110_t.jpg']")
  end
end

feature "Games show page when user is not logged in" do
  let!(:game) { Game.create!({:name=>"Where in the World is Carmen Sandiego?", :api_id=>8009, :description=>"Players answer trivia questions to move around the world.  By catching henchmen players can deduce where Carmen Sandiego is located and win the game.", :image_url=>"//cf.geekdo-images.com/images/pic42110.jpg", :thumbnail_url=>"//cf.geekdo-images.com/images/pic42110_t.jpg", :min_players=>2, :max_players=>6, :playing_time=>60}) }

  scenario "User can't write review if they're not logged in" do
    visit "/games/#{game.id}"
    expect(page).to_not have_xpath('.//a', text: "Leave a review")
  end
  scenario "User can't add game to their collection if they're not logged in" do
    visit "/games/#{game.id}"
    expect(page).to_not have_css("input[value='Add to collection']")
  end
end

feature "Games show page when user is not logged in" do
  let!(:game) { Game.create!({:name=>"Where in the World is Carmen Sandiego?", :api_id=>8009, :description=>"Players answer trivia questions to move around the world.  By catching henchmen players can deduce where Carmen Sandiego is located and win the game.", :image_url=>"//cf.geekdo-images.com/images/pic42110.jpg", :thumbnail_url=>"//cf.geekdo-images.com/images/pic42110_t.jpg", :min_players=>2, :max_players=>6, :playing_time=>60}) }
  let!(:user) { User.create(firstname: "bob", lastname: "bob", email: "bob@bob.com", password: "bob") }

  before(:each) do
    visit "/login"
    within('#main-content form') do
      fill_in 'email', :with => 'bob@bob.com'
      fill_in 'password', :with => 'bob'
    end
    click_button 'Login'
    visit "/games/#{game.id}"
  end


  scenario "User has option to add game to their collection if they're logged in" do
    expect(page).to have_css("input[value='Add to collection']")
  end

  scenario "User can add game to their collection if they're logged in" do
    click_button "Add to collection"
    expect(page).to have_content("This game is in your collection")
  end

  scenario "User can remove game from their collection if they're logged in" do
    click_button "Add to collection"
    click_button "Remove"
    expect(page).to have_css("input[value='Add to collection']")
  end

  scenario "User can write review if they're logged in" do
    expect(page).to have_xpath('.//a', text: "Leave a review")
  end

end
