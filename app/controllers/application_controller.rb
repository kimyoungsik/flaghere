class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  before_filter :noname_user, :except => [:destroy]
  before_filter :facebook_auth, :except => [:destroy]
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
  
  

end
