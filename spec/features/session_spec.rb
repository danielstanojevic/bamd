require 'rails_helper'


feature "Signing in" do
  background do
    User.create(:username => 'mickey', :password => 'disney')
  end

  scenario "Signing in with correct credentials" do
    visit '/login'
      fill_in 'session[username]', :with => 'mickey'
      fill_in 'session[password]', :with => 'disney'
      click_button 'Login'
      expect(page).to have_content 'Logout'
  end

  scenario "Signing in with invalid password" do
    visit '/login'
      fill_in 'session[username]', :with => 'mickey'
      fill_in 'session[password]', :with => 'goofy'
      click_button 'Login'
      expect(page).to have_content 'Login'
  end

  scenario "Signing in with invalid username" do
    visit '/login'
      fill_in 'session[username]', :with => 'minnie'
      fill_in 'session[password]', :with => 'disney'
      click_button 'Login'
      expect(page).to have_content 'Login'
  end


end


# feature "User registration" do
#   xscenario "when user enters valid info" do
#     visit '/login'
    
#   end

#   xscenario "when user enters invalid info" do
#     visit ''
#     ##
#   end
# end

# feature "User login" do
#   xscenario "user logs in with correct email and password combination" do
#     visit ''

#   end

#   xscenario "user logs in with invalid password" do
#     visit ''

#   end

#   xscenario "user logs in with non-exiting username" do
#     visit ''

#   end

# end