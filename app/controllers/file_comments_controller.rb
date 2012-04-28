class FileCommentsController < ApplicationController
before_filter :authenticate_user!

  respond_to :html,
             :json

  def create
    #render :text => params.inspect;return
    @post = Post.find(params[:post_id])
    if params[:file_name]["upload"] != "" and params[:file_comment][:doc_file].original_filename != ""
        file_name = params[:file_name]["upload"].gsub(/[^0-9A-Za-z]/, '')
        #.to_s.gsub(" ","_")
        fileext = params[:file_comment][:doc_file].original_filename.strip.split(".").last
        file_name = "#{file_name}"+".#{fileext}"
        #render :text =>file_name.inspect;return
        #@post.update_attribute(:doc_file_name, file_name)
    end
    doc_file = params[:file_comment][:doc_file]
    user_id =  current_user.id #params[:file_comment][:user_id]
    file_type = params[:file_type]
    relevance = params[:relevance]
    privacy = params[:privacy]
    link_url = params[:link_url][:url]

    @file_comment = @post.file_comments.create!(:doc_file => doc_file, :user_id => user_id,
                                                :file_name => file_name, :file_type => file_type,
                                                :relevance => relevance, :privacy => privacy,
                                                :link_url => link_url)
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
