require 'rails_helper'

feature "Game index" do

  before(:all) do
    @mickey = User.create(username: 'mickey', password: 'disney')
    @minnie = User.create(username: 'minnie', password: 'world')
    @catan = Game.create(name: 'Catan', description: 'strategic conquering game')
    @blackjack = Game.create(name: 'Blackjack', description: 'card game based on logic and luck')
    @strategy = Mechanic.create(description: 'strategy')
    @building = Mechanic.create(description: 'city-building')
    @review = Rating.create(stars: 1, comment: "Not fun", author_id: @mickey.id)

    @catan.ratings << @review
    @catan.mechanics.push(@strategy, @building)
    @blackjack.mechanics << @strategy
    @mickey.owned_games << @catan
    @minnie.owned_games << @blackjack
    @mickey.friendships.create(to_id: @minnie.id, confirmed: true)
  end

  after(:all) do
    User.destroy_all
    Game.destroy_all
    Rating.destroy_all
    Mechanic.destroy_all
  end

  scenario "when user visits home page without logging in" do
    visit '/'
    expect(page).to have_content 'Login'
    expect(page).to have_content 'Catan'
    expect(page).to have_content 'Blackjack'
  end

  scenario "when user clicks on a game without logging in" do
    visit "/games/#{Game.first.id}"
    expect(page).to have_content 'Login'
    expect(page).to have_content 'Catan'
  end

  scenario "when user visits own profile page after logging in" do
    visit '/login'
      fill_in 'session[username]', :with => 'mickey'
      fill_in 'session[password]', :with => 'disney'
      click_button 'Login'
    visit "/users/#{User.first.id}"
      expect(html).to have_content 'Logout'
      expect(html).to have_content 'mickey'
      expect(html).to have_content 'Catan'
      expect(html).to have_content 'minnie'
  end

  scenario "when user visits friend's profile page after logging in" do
    visit '/login'
      fill_in 'session[username]', :with => 'mickey'
      fill_in 'session[password]', :with => 'disney'
      click_button 'Login'
    visit "/users/#{User.all[1].id}"
      expect(html).to have_content 'Logout'
      expect(html).to have_content 'minnie'
      expect(html).to have_content 'Blackjack'
  end
end

