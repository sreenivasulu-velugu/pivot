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
    @user_posts = Post.where(user_id: "#{current_user.id}")
    @posts = Post.all.order_by([:created_at, :desc]).page(current_page).per(20)
    @user = User.find(params[:id])
  end

    

end
