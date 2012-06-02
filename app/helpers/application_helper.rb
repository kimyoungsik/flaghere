#encoding:utf-8
module ApplicationHelper
  
  def profile_photo (user, size, width)
    if user.facebook_profile_photo
      image_tag(user.facebook_profile_photo)
    elsif user.avatar
      image_tag(user.avatar.url(size), :width => width)
    else
      image_tag('/assets/default_profile.png', :width => width)
    end
  end
  
end
