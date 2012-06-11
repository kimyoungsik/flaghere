class Badge < ActiveRecord::Base
  attr_accessible :description, :name, :badgephoto

  
  has_attached_file :badgephoto, :styles => { :thumb =>  "50x50#", :small => "150x150#", :large => "640x640>" },
    :url => "/system/badgephotos/:id/:style/:basename.:extension",
    :path => ":rails_root/public/system/badgephotos/:id/:style/:basename.:extension"
    
  validates_attachment_presence :badgephoto
  validates_attachment_size :badgephoto, :less_than => 5.megabytes
  validates_attachment_content_type :badgephoto, :content_type => ['image/jpeg', 'image/png']
  
  
end
