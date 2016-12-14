require 'rails_helper'
RSpec.describe SessionsController do 
	describe "setting the session" do 
		it "logs a user in with valid form data" do
			@user = create_user
			visit "/"
			fill_in 'login_user[email]', with: @user.email
			fill_in 'login_user[password]', with: @user.password
			click_button 'Log In'
			expect(current_path).to eq("/users/#{@user.id}")
			expect(page).to have_text(@user.name)
		end
	end
	describe "destroying the session" do 
		it "logs out a user and returns to sessions/new" do 
			@user = create_user
			log_in @user
			click_button "Logout"
			expect(current_path).to eq("/sessions/new")
		end
	end
end