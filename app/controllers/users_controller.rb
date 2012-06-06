class UsersController < ApplicationController
  before_filter :store_location, :only => [:show]
  def index
    @users = User.order("id").page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
    @kits = @user.kits.page(params[:page]).per(20)
    @kit = @user.kits.build
    
  end
  
  # GET /kits/1/edit
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])

    
    respond_to do |format|
       if @user.update_attributes(params[:user])
         format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
         format.json { respond_with_bip(@user) }
       else
         format.html { render :action => "edit" }
         format.json { respond_with_bip(@user) }
       end
    end     
  end
  
  private
  
  def store_location
      session[:return_to] = request.fullpath
  end
end
