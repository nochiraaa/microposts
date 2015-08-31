class UsersController < ApplicationController
  
  before_action :set_user, only: [:edit, :update, :followings, :followers]  
  
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update 

    if @user.update(user_params)
      flash[:success] = "Updated your profile!"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def followings
    render 'followings'
  end
  
  def followers
    render 'followers'
  end
  
  private 
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :profile, :age, :hobby)
    end
    
    def set_user
      @user = User.find(params[:id])
    end
end
