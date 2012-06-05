#encoding:utf-8
module ApplicationHelper
  
  def profile_photo (user, size, width)
    
    if user.facebook_profile_photo
      if size == :large
        image_tag(user.facebook_profile_photo_large)
      else
        image_tag(user.facebook_profile_photo)
      end
    elsif user.avatar_file_name
      image_tag(user.avatar.url(size), :width => width)
    else
      image_tag('/assets/default_profile.png', :width => width)
    end
  end
  
  def flag_image(image, size)
    image_tag(image.picture.url(size))
  end
  
  def hiking_image(image, size)
    image_tag(image.hikingphoto.url(size))
  end
  
  def flag_photo(image, size)
    image_tag(image.photo.url(size))
  end
  
end
