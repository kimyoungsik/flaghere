class Hiking < ActiveRecord::Base
  attr_accessible :datetime, :description, :limit, :location, :name, :province_id, :status, :user_id, :hikingphoto
  
  belongs_to :user
  has_many :hikingparticipations, :dependent => :destroy
  has_many :hikingparticipants, :through => :participations, :source => :user
  
  has_many :kits, :as => :kitable, :dependent => :destroy
  
  has_attached_file :hikingphoto, :styles => { :thumb =>  "50x50#", :small => "150x150>", :large => "640x640>" },
    :url => "/assets/hikings/:id/:style/:basename.:extension",
    :path => ":rails_root/public/assets/hikings/:id/:style/:basename.:extension"
    
  validates_attachment_presence :hikingphoto
  validates_attachment_size :hikingphoto, :less_than => 5.megabytes
  validates_attachment_content_type :hikingphoto, :content_type => ['image/jpeg', 'image/png']
end