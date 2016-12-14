require 'rails_helper'

RSpec.describe SecretsController, type: :controller do

  describe "GET #home" do
    it "returns http success" do
      get :home
      expect(response).to have_http_status(:success)
    end
  end

  describe "secrets wall" do 
  	it "has a method that grabs all the secrets" do
  		@secrets = Secret.all

  	end
  end

end
