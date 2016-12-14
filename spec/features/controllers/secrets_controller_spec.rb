require 'rails_helper'
RSpec.describe SecretsController do 
	describe "creating secret" do 
		it "creates secret and redirects to profile page" do 
			@user = create_user
			log_in @user
			fill_in 'secret[content]', with: "Bob's first secret"
			click_button "Create Secret"
			expect(current_path).to eq("/users/#{@user.id}")
			expect(page).to have_text("Bob's first secret")
		end
	end
	describe "destroying secret" do 
		it "rejects secret destruction if secret owner isn't current user" do 
			@user = create_user
			log_in @user
			@secret = @user.secrets.create(content:"shouldnt be deleted")
			visit "/secrets"
			click_button "Logout"
			@user2 = User.create(name:"bim", email:"bim@bo.com", password:"password", password_confirmation:"password")
			log_in @user2
			visit "/secrets"
			@secret.destroy
			expect(page).to have_text(@secret.content)
		end
		it "destroys secret if secret owner is current user" do 
			@user = create_user
			log_in @user
			@secret = @user.secrets.create(content:"secret")
			click_button "Delete"
			expect(page).not_to have_text(@secret.content)
		end
	end
end

