#encoding:utf-8
class Hiking < ActiveRecord::Base
  attr_accessible :name, :datetime, :limit, :province_id, :user_id, :presence, :location, :money ,:course ,:level, :day, :hour, :call, :hikingphoto, :hikingtype_id, :description
  
  belongs_to :user
  has_many :hikingparticipations, :dependent => :destroy
  has_many :hikingparticipants, :through => :participations, :source => :user
  
  has_many :kits, :as => :kitable, :dependent => :destroy
  
  has_attached_file :hikingphoto, :styles => { :thumb =>  "50x50#", :small => "150x150#", :large => "640x640>" },
    :url => "/system/hikings/:id/:style/:basename.:extension",
    :path => ":rails_root/public/system/hikings/:id/:style/:basename.:extension"
    
  validates_attachment_presence :hikingphoto
  validates_attachment_size :hikingphoto, :less_than => 5.megabytes
  validates_attachment_content_type :hikingphoto, :content_type => ['image/jpeg', 'image/png']

  default_scope :order => 'hikings.datetime DESC '
  

  validates :name, :datetime, :limit, :province_id, :user_id, :presence, :location, :money ,:course ,:level, :day, :hour, :call, :hikingtype_id, :presence => true
  validates :limit, numericality: {greater_than_or_equal_to: 0}
  validates :money, numericality: {greater_than_or_equal_to: 0}
  
end
