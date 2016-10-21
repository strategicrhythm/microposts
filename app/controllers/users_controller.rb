class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :destroy, :following, :follower]
  before_action :correct_user, only: [:edit, :update]
  
  def show
    @user = User.find(params[:id])
    #@microposts = @user.microposts.order(created_at: :desc)
    @microposts = @user.microposts.order(created_at: :desc).page params[:page]
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "welcome to the Sample application"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.following_users.order(created_at: :desc)
  end
  
  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.follower_users.order(created_at: :desc)
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :born, :location, :gender)
  end
  
  def correct_user
    @user = User.find(params[:id])
    unless @user == current_user
    redirect_to(root_url)
    end
  end
  
end
