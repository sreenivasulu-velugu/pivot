class SessionsController < ApplicationController

  def new
    redirect_to '/auth/linkedin'
  end


  def create
    auth = request.env["omniauth.auth"]

    user = User.where(:provider => auth['provider'], 
                      :uid => auth['uid']).first || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    if auth['info']['image'] ==
    session[:image_url] = auth['info']['image']
    if user.email == "" or user.email == nil
      redirect_to edit_user_path(user), :alert => "Please enter your email address."
    else
      redirect_to user_path(user.id), :notice => 'Signed in!'
      #redirect_to root_url, :notice => 'Signed in!'
    end

  end

  def destroy
    reset_session
    redirect_to root_url, :notice => 'Signed out!'
  end

  def failure
    redirect_to root_url, :alert => "Authentication error: #{params[:message].humanize}"
  end

end
