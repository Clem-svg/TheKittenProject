class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(current_user.id)
    @orders = current_user.orders
  end

  def create
    flash[:notice] = "Registration needed"
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      flash[:notice] = "Profil édité !"
      redirect_to user_path(@user)
    else
      flash.now[:alert] = "Impossible d'éditer le profil :"
      render :edit
    end 
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :avatar)
  end

end
