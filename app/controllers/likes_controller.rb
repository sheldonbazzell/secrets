class LikesController < ApplicationController
	before_action :require_login

	def create
		@user = current_user
		@secret = Secret.find(params[:like][:secret_id])
		@secret.likes.create(user:@user)
		redirect_to "/secrets"
	end

	def destroy
		@user = current_user
		@secret = Secret.find(params[:like][:secret_id])
		@like = Like.where(user:@user, secret:@secret).first.destroy
		redirect_to "/secrets"
	end
end
