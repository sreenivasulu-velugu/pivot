class FileCommentsController < ApplicationController
before_filter :authenticate_user!

  respond_to :html,
             :json

  def create
    #render :text => params.inspect;return
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create!(params[:comment])
    respond_to do |format|
        format.js {}
        format.json { render :nothing => true, :status => 204 }
        format.all {redirect_to @post, :notice => "Comment created!"}
    end
    
  end



  def destroy
    @comment = FileComment.find(params[:id])
    if current_user.owns?(@comment) || current_user.owns?(@comment.parent)
      current_user.retract(@comment)
      respond_to do |format|
        format.js { render :nothing => true, :status => 204 }
        format.json { render :nothing => true, :status => 204 }
        format.mobile{ redirect_to @comment.post }
      end
    else
      respond_to do |format|
        format.mobile {redirect_to :back}
        format.any(:js, :json) {render :nothing => true, :status => 403}
      end
    end
  end

  def new
    render :layout => false
  end


  protected

  def find_post
    if user_signed_in?
      @post = current_user.find_visible_shareable_by_id(Post, params[:post_id])
    else
      @post = Post.find_by_id_and_public(params[:post_id], true)
    end
  end

end
