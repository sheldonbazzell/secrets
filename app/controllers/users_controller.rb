class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create]

  def create
    @user = User.new( user_params )
    if !@user.valid?
      flash[:reg_errors] = @user.errors.full_messages.to_sentence
      redirect_to "/users/new"
  	else
      @user.save! 
      session[:id] = @user.id
      redirect_to "/users/#{session[:id]}"
  	end
  end

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to "/users/#{session[:id]}"
  end

  def destroy
    @user = current_user
    @user.destroy
    redirect_to "/users/new"
  end

  def user_params
  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
