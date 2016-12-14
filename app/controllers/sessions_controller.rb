class SessionsController < ApplicationController

	def create
	  	user = User.where(email:params[:login_user][:email]).first
	  	if user
	  		user.authenticate(params[:login_user][:password])
			session[:id] = user.id
			redirect_to "/users/#{session[:id]}"
		else
			flash[:login_errors] = "Invalid password / email"
			redirect_to "/sessions/new"
		end
	end

	def destroy
		reset_session
		redirect_to "/sessions/new"
	end
end
