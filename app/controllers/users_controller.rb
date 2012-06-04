class UsersController < ApplicationController
  before_filter :store_location, :only => [:show]
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @kits = @user.kits.page(params[:page]).per_page(20)
    @kit = @user.kits.build
  end
  
  private
  
  def store_location
      session[:return_to] = request.fullpath
  end
end
