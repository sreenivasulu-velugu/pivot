class UsersController < ApplicationController
  before_filter :authenticate_user!
  #before_filter :correct_user?

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
    if current_user == @user
      @posts = Post.all.order_by([:created_at, :desc]).page(current_page).per(20)
    else
      @posts = Post.where(user_id: @user.id).order_by([:created_at, :desc]).page(current_page).per(20)
    end
  end

  def explore
    @posts = Post.all.order_by([:created_at, :desc]).page(current_page).per(20)
  end

  def follow_pivoters
    @user = User.find(params[:id])
    following_list = current_user.following_list || []
    follower_list = @user.follower_list || []
    
    if !following_list.include?(@user.id)
      following_list << @user.id
      user = User.find(current_user.id)
      user.update_attributes(:following_list =>following_list)
      follower_list << user.id
      @user.update_attributes(:follower_list => follower_list)
    end
    flash[:notice] = "Followed Successfully."
    redirect_to "/users/#{current_user.id}/?following=true"
  end

  def unfollow
    @user = User.find(params[:id])
    if current_user.following_list.include?(@user.id)
      following_list = current_user.following_list
      follower_list = @user.follower_list
      followng_list.delete(@user.id)
      follower_list.delete(current_user.id)
      user = User.find(current_user.id)
      user.update_attributes(:following_list => following_list)
      @user.update_attributes(:follower_list => follower_list)
    end
    flash[:notice] = "Unfollowed Successfully."
    redirect_to "/users/#{current_user.id}/?following=true"
  end

  def like_post
    @post = Post.find(params[:id])
    like_list = current_user.likes || []
    if !like_list.include?(@post.id)
      like_list << @post.id
      user = User.find(current_user.id)
      user.update_attributes(:likes =>like_list)
      like_count = @post.like_count + 1
      @post.update_attributes(:like_count => like_count)
    end
    flash[:notice] = "Liked Successfully."
    redirect_to "/users/#{current_user.id}"
  end

  def unlike_post
    @post = Post.find(params[:id])
    
    if current_user.likes.include?(@post.id)
      like_list = current_user.likes
      like_list.delete(@post.id)
      user = User.find(current_user.id)
      user.update_attributes(:likes => like_list)
      like_count = @post.like_count - 1
      @post.update_attributes(:like_count => like_count)
    end
    flash[:notice] = "Unliked Successfully."
    redirect_to "/users/#{current_user.id}"
  end

  def follow_pivot
    @post = Post.find(params[:id])
    following_pivots = current_user.following_pivots || []
    if !following_pivots.include?(@post.id)
      following_pivots << @post.id
      user = User.find(current_user.id)
      user.update_attributes(:following_pivots =>following_pivots)
    end
    flash[:notice] = "Followed Successfully."
    redirect_to "/users/#{current_user.id}/?followed=true"
  end

  def unfollow_pivot
    @post = Post.find(params[:id])
    
    if current_user.following_pivots.include?(@post.id)
      following_pivots = current_user.following_pivots
      following_pivots.delete(@post.id)
      user = User.find(current_user.id)
      user.update_attributes(:following_pivots => following_pivots)
    end
    flash[:notice] = "Unliked Successfully."
    redirect_to "/users/#{current_user.id}/?followed=true"
  end

  

end
