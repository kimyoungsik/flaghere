class Flag < ActiveRecord::Base
  attr_accessible :date, :description, :location, :name, :province_id, :user_id, :photo
  
  belongs_to :user
  
  has_attached_file :photo, :styles => { :thumb =>  "50x50#", :small => "150x150>", :large => "640x640>" },
    :url => "/assets/flags/:id/:style/:basename.:extension",
    :path => ":rails_root/public/assets/flags/:id/:style/:basename.:extension"
    
  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']
end
