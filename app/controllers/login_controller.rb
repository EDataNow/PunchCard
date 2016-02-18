class LoginController < ApplicationController

  def index
  end

  def create
    session[:username] = params[:login][:username]
    redirect_to assignments_path
  end

  def delete
    session[:username] = nil
    redirect_to login_index_path
  end
end
