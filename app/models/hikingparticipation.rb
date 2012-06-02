class Hikingparticipation < ActiveRecord::Base
  attr_accessible :hiking_id, :user_id
  
  belongs_to :user
  belongs_to :hiking
  
  validates :user_id, :presence => true
  validates :hiking_id, :presence => true
  validates_uniqueness_of :user_id, :scope => [:hiking_id]
  
end
