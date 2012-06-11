#encoding:utf-8
module ApplicationHelper
  
  def profile_photo (user, size, width)
    
    if user.avatar_file_name
      image_tag(user.avatar.url(size))
    elsif user.facebook_profile_photo
      if size == :large
        image_tag(user.facebook_profile_photo_large)
      else
        image_tag(user.facebook_profile_photo)
      end
    else
      image_tag('default_profile.png', :width => width)
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
  
  def badge_photo(image,size)
    image_tag(image.badgephoto.url(size))
  end
  
  def full_title(page_title)
   base_title = "망고마운틴"
   if page_title.empty?
     base_title
   else
     "#{page_title}"
   end
  end
  
  def province_badge?(province,user)
    i = 0
    firstplayers = user.flags.all
    firstplayers.each do |firstplayer|
  		if firstplayer.province_id == province
  			i = i + 1
  		end
	  end
	
	  if i < 3
		  players =  user.participations.all
	    players.each do |player|
  			if player.flag.province_id == province
  			  i = i + 1
  			end
  		end
		end
	  
	  return i
  end
  
  
end
