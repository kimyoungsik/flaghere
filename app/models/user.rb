class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :birthday, :gender, :facebook_uid, :facebook_token
  
  has_many :flags, :dependent => :destroy
  # has_many :participations, :dependent => :destroy
  belongs_to :province
   
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
end
