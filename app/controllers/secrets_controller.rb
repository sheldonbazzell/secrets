class SecretsController < ApplicationController
  before_action :require_login, only: [:home, :create, :destroy]

  def home
  	@secrets = Secret.all
  end

  def create
  	@user = current_user
  	@secret = @user.secrets.new(secret_params)
  	if !@secret.valid?
  		flash[:secret_errors] = @secret.errors.full_messages.to_sentence
  	else
  		@secret.save!
  	end
    data = @secret
    render json: data
  end

  def destroy
  	Secret.find(params[:id]).destroy
  	redirect_to "/users/#{current_user.id}"
  end

  private
  def secret_params
  	params.require(:secret).permit(:content)
  end
end
