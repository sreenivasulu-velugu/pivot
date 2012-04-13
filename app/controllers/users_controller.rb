class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :correct_user?

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to @user
    else
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
    @user_posts = Post.where(user_id: "#{@user.id}")
    @posts = Post.all.order_by([:created_at, :desc]).page(current_page).per(20)
    
  end

  def explore
    @posts = Post.all.order_by([:created_at, :desc]).page(current_page).per(20)
  end

  def follow
    @user = User.find(params[:id])
    @followers = @user.followers 
    @follower << current_user.id
    @user.update_attributes(:followers => @followers)
    redirect_to @user
  end

  

end
