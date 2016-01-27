require 'rails_helper'

feature 'navbar actions for NO logged in user' do

  scenario "when a user is NOT logged in, he sees the Login button" do
    visit '/'

    expect(page).to have_xpath('.//a', text: "Login")
  end

  scenario "when a user is NOT logged in, he sees the Register button" do
    visit '/'

    expect(page).to have_xpath('.//a', text: "Register")
  end

  scenario "when a user is NOT logged in, he does NOT see the Logout button" do
    visit '/'

    expect(page).to_not have_xpath('.//a', text: "Logout")
  end

end


feature "navbar actions for logged in user" do

  let!(:user) {User.create(firstname: "joe", lastname: "joe", email: "joe@joe.com", password: "joe", id: 5)}

  scenario "when a user is logged in, he sees the profile button" do
    visit '/login'

    within('#main-content form') do
      fill_in 'email', :with => 'joe@joe.com'
      fill_in 'password', :with => 'joe'
    end

    click_button 'Login'
    expect(page).to have_css("a[href='#{user_path(user)}']")
  end

  scenario "when a user is logged in, he sees the Logout button" do
    visit '/login'

    within('#main-content form') do
      fill_in 'email', :with => 'joe@joe.com'
      fill_in 'password', :with => 'joe'
    end

    click_button 'Login'
    expect(page).to have_xpath('.//a', text: "Logout")
    end

  scenario "when a user is logged in, he does NOT see the Login button" do
    visit '/login'

    within('#main-content form') do
      fill_in 'email', :with => 'joe@joe.com'
      fill_in 'password', :with => 'joe'
    end

    click_button 'Login'
    expect(page).to_not have_xpath('.//a', text: "Login")
  end

  scenario "when a user is logged in, he does NOT see the Register button" do
    visit '/login'

    within('#main-content form') do
      fill_in 'email', :with => 'joe@joe.com'
      fill_in 'password', :with => 'joe'
    end

    click_button 'Login'
    expect(page).to_not have_xpath('.//a', text: "Register")
  end


end
