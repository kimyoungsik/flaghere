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
  
  def province_badge?(user)
   
    province = { "1" => 0, "2" => 0, "3" => 0,"4" => 0, "5" =>0 ,"6"=>0, "7"=>0,"8"=>0,"9"=>0, "10" =>0 ,"11"=>0,"12"=>0,"13"=>0,"14"=>0,"15"=>0,"16"=>0,"17"=>0}
    players =  user.participations.all
    players.each do |player|
      case player.flag.province_id
      when 1
        province["1"] = province["1"] + 1
      when 2
        province["2"] = province["2"] + 1
      when 3
        province["3"] = province["3"] + 1
      when 4
        province["4"] = province["4"] + 1
      when 5
        province["5"] = province["5"] + 1
      when 6
        province["6"] = province["6"] + 1
      when 7
       province["7"] = province["7"] + 1
      when 8
        province["8"] = province["8"] + 1
      when 9
        province["9"] = province["9"] + 1
      when 10
        province["10"] = province["10"] + 1
      when 11
        province["11"] = province["11"] + 1
      when 12
        province["12"] = province["12"] + 1
      when 13
        province["13"] = province["13"] + 1
      when 14
        province["14"] = province["14"] + 1
      when 15
        province["15"] = province["15"] + 1
      when 16
        province["16"] = province["16"] + 1
      when 17
        province["17"] = province["17"] + 1
      end
    end

    firstplayers = user.flags.all
    firstplayers.each do |firstplayer|
  		case firstplayer.province_id
  	  when 1
         province["1"] = province["1"] + 1
      when 2
         province["2"] = province["2"] + 1
      when 3
         province["3"] = province["3"] + 1
      when 4
         province["4"] = province["4"] + 1
      when 5
         province["5"] = province["5"] + 1
      when 6
         province["6"] = province["6"] + 1
      when 7
        province["7"] = province["7"] + 1
      when 8
         province["8"] = province["8"] + 1
      when 9
         province["9"] = province["9"] + 1
      when 10
         province["10"] = province["10"] + 1
      when 11
         province["11"] = province["11"] + 1
      when 12
         province["12"] = province["12"] + 1
      when 13
         province["13"] = province["13"] + 1
      when 14
         province["14"] = province["14"] + 1
      when 15
         province["15"] = province["15"] + 1
      when 16
         province["16"] = province["16"] + 1
      when 17
         province["17"] = province["17"] + 1
      end
	  end
	  province = province.select {|k,v| v > 4 }
	  province = province.keys  
	  return province
  end
  
  
end
