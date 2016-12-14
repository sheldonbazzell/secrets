require 'rails_helper'
RSpec.describe LikesController do 
	describe "creating likes" do 
		it "has a like button that increases number of likes by 1" do 
			@user = create_user
			log_in @user
			visit "/users/#{@user.id}"
			@secret1 = @user.secrets.create(content:"my secret")
			click_button("Like")
			expect(page).to have_text("1 likes")
			expect(page).to have_button("Unlike")
			expect(page).not_to have_button("Like")
		end
	end
end