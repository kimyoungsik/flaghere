class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  before_filter :noname_user, :except => [:destroy]
  before_filter :facebook_auth, :except => [:destroy]
  before_filter :prepare_for_mobile
  def noname_user
    if user_signed_in? and (current_user.first_name.blank? or current_user.last_name.blank?)
      redirect_to gettingstarted_step1_path
    end
  end
  
  def facebook_auth
    if signed_in? and current_user.facebook_uid
      @graph = Koala::Facebook::API.new(current_user.facebook_token)
    end
  end
  
  private  
  def mobile_device?  
    if session[:mobile_param]  
      session[:mobile_param] == "1"  
    else  
      request.user_agent =~ /Mobile|webOS/  
    end  
  end  
  helper_method :mobile_device?  
  
  def prepare_for_mobile  
    session[:mobile_param] = params[:mobile] if params[:mobile]  
  end

end
