#encoding:utf-8
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :birthday, :gender, :facebook_uid, :facebook_token, :avatar, :facebook_connect
  
  has_attached_file :avatar, :styles => { :thumb =>  "50x50#", :small => "150x150>", :large => "640x640>" },
    :url => "/system/users/:id/:style/:basename.:extension",
    :path => ":rails_root/public/system/users/:id/:style/:basename.:extension"
    
  # validates_attachment_presence :avatar
  validates_attachment_size :avatar, :less_than => 5.megabytes
  validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png']
  
  
  has_many :flags, :dependent => :destroy
  has_many :hikings, :dependent => :destroy
  has_many :participations, :dependent => :destroy
  has_many :hikingparticipations, :dependent => :destroy
  belongs_to :province
  
  has_many :kits, :as => :kitable, :dependent => :destroy
  has_many :authored_kits, :class_name => "Kit", :dependent => :destroy
  has_many :comments, :dependent => :destroy
  
  default_scope :order => 'users.updated_at DESC'
  # attr_accessible :title, :body
  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["user_hash"]
        user.email = data["email"]
      end
    end
  end
  
  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)

    data = access_token.extra.raw_info
    if user = User.find_by_email(data.email)
      user
    else # Create a user with a stub password. 
      User.create!(:email => data.email, 
                    :first_name => data.first_name, 
                    :last_name => data.last_name, 
                    :birthday => Date::strptime(data.birthday, "%m/%d/%Y"),
                    :gender => data.gender,
                    :facebook_uid => data.id,
                    :facebook_token => access_token.credentials.token,
                    :password => Devise.friendly_token[0,20]) 
    end
  end
  def korean_full_name
    if( last_name and first_name)
      last_name + first_name
    else
      "ㅇㅇㅇ"
    end
  end
  
  def participates_in?(flag)
    Participation.where(:user_id => self.id, :flag_id => flag.id).any?
  end
  
  def hikingparticipates_in?(hiking)
    Hikingparticipation.where(:user_id => self.id, :hiking_id => hiking.id).any?
  end
  
  def facebook_profile_photo
    if self.facebook_uid?
      "http://graph.facebook.com/#{self.facebook_uid}/picture?type=square"
    else 
      false
    end
  end
  
  def facebook_profile_photo_large
     if self.facebook_uid?
       "http://graph.facebook.com/#{self.facebook_uid}/picture?type=large"
     else 
       false
     end
   end
   
end
