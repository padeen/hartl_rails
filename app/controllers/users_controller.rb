class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]


  def new
    @user = User.new
  end

  def show
  end

	def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
  end

	def update
    if @user.update_attributes(user_params)
      # Handle a successful update.
    else
      render 'edit'
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, 
                                 :password_confirmation)
  end
end
