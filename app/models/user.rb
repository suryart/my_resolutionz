class User < ActiveRecord::Base
  include TheComments::User

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  has_many :authentications
  has_many :resolutions
  has_one :profile

  accepts_nested_attributes_for :profile, :allow_destroy => :false, :reject_if => proc { |attrs| attrs['first_name'].blank? }
  
  delegate :first_name, :last_name, :age, :to => :profile, :prefix => false

  def name
    self.first_name
  end

  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    data = access_token.extra.raw_info
    if user = User.find_by_email(data.email)
      authentication = Authentication.find_or_create_by_provider_and_uid(access_token.provider, access_token.uid)
      user.authentications << authentication if authentication.update_attributes(:auth_token => access_token.token)
      user
    else 
      # Create a user with a stub password. 
      image_url = [access_token.info.image.split('?').first, 'type=large'].join('?')
      user = User.create!(:email => data.email, :password => Devise.friendly_token[0,20], :avatar => image_url, :profile_attributes=> {:first_name => data.first_name, :last_name => data.last_name, :gender => data.gender, :username => data.username})
      user.authentications << Authentication.create!(:provider => access_token.provider, :auth_token => access_token.token, :uid => access_token.uid)
      user
    end
  end

  def admin?
     self == User.first
   end

   def comments_admin?
     admin?
   end

   def comments_moderator? comment
     id == comment.holder_id
   end
end
