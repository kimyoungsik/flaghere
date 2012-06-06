class UsersController < ApplicationController
  before_filter :store_location, :only => [:show]
  def index
    @users = User.order("id").page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
    @kits = @user.kits.page(params[:page]).per(20)
    @kit = @user.kits.build
    @graph = Koala::Facebook::API.new(@user.facebook_token) # 1.2beta and beyond
  end
  
  private
  
  def store_location
      session[:return_to] = request.fullpath
  end
end
