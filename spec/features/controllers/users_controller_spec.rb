require 'rails_helper'
RSpec.describe UsersController do 
	describe "creating a user" do
		it "creates and logs in a user if form data is valid" do 
			visit "users/new"
			fill_in 'user[name]', with: "Sheldon"
			fill_in 'user[email]', with: "sheldon@g.com"
			fill_in 'user[password]', with: "password"
			fill_in 'user[password_confirmation]', with: "password"
			click_button 'Join'
			user = User.last
			expect(current_path).to eq("/users/#{user.id}")
			expect(page).to have_text(user.name)
		end
	end
	describe "rejecting false user" do 
		it "rejects user creation with invalid form data and displays errors" do 
			visit "users/new"
			fill_in 'user[name]', with: "Sheldon"
			fill_in 'user[email]', with: ""
			fill_in 'user[password]', with: "password"
			fill_in 'user[password_confirmation]', with: "password"
			click_button 'Join'
			user = User.last
			expect(current_path).to eq("/users/new")
			expect(page).to have_text("Email can't be blank")
		end
	end
end