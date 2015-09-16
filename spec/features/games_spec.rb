require 'rails_helper'

feature "Game index" do

  before(:each) do
    @mickey = User.create(username: 'mickey', password: 'disney')
    @catan = Game.create(name: 'Catan', description: 'strategic conquering game')
    @blackjack = Game.create(name: 'Blackjack', description: 'card game based on logic and luck')
    @strategy = Mechanic.create(description: 'strategy')
    @building = Mechanic.create(description: 'city-building')
    @review = Rating.create(stars: 1, comment: "Not fun")

    @catan.ratings << @review
    @catan.mechanics.push(@strategy, @building)
    @blackjack.mechanics << @strategy
    @mickey.owned_games << @catan
  end

  after(:each) do
    [@mickey, @catan, @blackjack, @strategy, @building, @review].each { |data| data.destroy }
  end

  scenario "when user visits home page without logging in" do
    visit '/'
    expect(page).to have_content 'Login'
    expect(page).to have_content 'Catan'
    expect(page).to have_content 'Blackjack'
  end

  scenario "when user clicks on a game without logging in" do
    visit "/games/#{@catan.id}"
    expect(page).to have_content 'Login'
    expect(page).to have_content 'Catan'
  end

end

