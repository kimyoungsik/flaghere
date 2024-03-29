class Participation < ActiveRecord::Base
  attr_accessible :flag_id, :user_id, :picture, :note, :date
  
  belongs_to :user
  belongs_to :flag
  validates :date, :presence => true
  validates :picture, :presence => true
  validates :user_id, :presence => true
  validates :flag_id, :presence => true
  validates_uniqueness_of :user_id, :scope => [:flag_id]
  
  has_attached_file :picture, :styles => { :thumb =>  "50x50#", :small => "150x150#", :large => "640x640>" },
  :url => "/system/participations/:id/:style/:basename.:extension",
  :path => ":rails_root/public/system/participations/:id/:style/:basename.:extension"

  validates_attachment_presence :picture
  validates_attachment_size :picture, :less_than => 5.megabytes
  validates_attachment_content_type :picture, :content_type => ['image/jpeg', 'image/png']
end
