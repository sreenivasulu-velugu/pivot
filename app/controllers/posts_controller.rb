

class PostsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_format_if_malformed_from_status_net, :only => :show


  def new
    @post = Post.new
  end
  
  def create
    #render :text => params.inspect;return
    unless params[:post].blank?
      @post = Post.create(params[:post])
      respond_to do |format|
        format.js {}
        format.json { render :nothing => true, :status => 204 }
        format.all {redirect_to user_path}
      end
    end
  end

  def index
    @posts = Post.all.page(current_page).per(1)
  end

  def show
  end

  def destroy
    @post = current_user.posts.where(:id => params[:id]).first
    if @post
      current_user.retract(@post)
      respond_to do |format|
        format.js {render 'destroy'}
        format.json { render :nothing => true, :status => 204 }
        format.all {redirect_to stream_path}
      end
    else
      Rails.logger.info "event=post_destroy status=failure user=#{current_user.diaspora_handle} reason='User does not own post'"
      render :nothing => true, :status => 404
    end
  end

  private

  def set_format_if_malformed_from_status_net
   request.format = :html if request.format == 'application/html+xml'
  end

  def can_not_comment_on_post?
    if !user_signed_in?
      true
    elsif @post.public && @post.author.local?
      false
    elsif current_user.contact_for(@post.author)
      false
    elsif current_user.owns?(@post)
      false
    else
      true
    end
  end
end
