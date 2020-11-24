class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def create
  end

  def edit
      @user = current_user
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "Profil édité !"
      redirect_to user_path(@user.id)
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
