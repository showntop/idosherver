require 'utils'
class User < ActiveRecord::Base

  has_one :user_profile, class_name: 'User::Profile', dependent: :destroy, inverse_of: :user

  delegate :gender, :location, :website, to: :user_profile

  validates :login, :allow_blank => true, :uniqueness => {:message=>"用户名已存在"}, :format => {:with=>/\A([a-z0-9_]+|)\z{5,15}/i, :message=>"用户名必须5-15个字符"}
  validates :email, :presence => true, :format => {:with=>/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i,:message=>"邮箱不正确"},:uniqueness => {:message => "邮箱已被注册"}
  #validates :password, :format => {:with=>/.{6,20}/i,:message=>"密码应为6-20个字符，需同时包含字母和数字"}
  #validates :password,:format => {:with=>/[\da-zA-Z]*((\d+[a-zA-Z]+)|([a-zA-Z]+\d+))[\da-zA-Z]*/,:message=>"密码须同时含字母数字"},:confirmation => true

  before_save :ensure_password_is_encrypted
  after_create :create_user_profile

  TOKEN_KEY_PREFIX = 'token:users:'
  TOKEN_EXPIRE_TIME = 60 * 60 * 24

  attr_accessor :token

  def self.find_by_token token
    key = $redis.keys("#{TOKEN_KEY_PREFIX}*").detect {|key| $redis.get(key) == token}
    return nil if key.blank?
    #Rails.logger.info $redis.get(key)
    user_id = key.gsub(TOKEN_KEY_PREFIX,'').to_i
    $redis.expire(key, TOKEN_EXPIRE_TIME)

    self.find(user_id)

  end

  # def token
  #   $redis.get("#{TOKEN_KEY_PREFIX}#{self.id}")#60 * 60 * 24 * 2 
  # end

  def settlein_token
    self.token = Utils.generate_uuid
    $redis.setex("#{TOKEN_KEY_PREFIX}#{self.id}",TOKEN_EXPIRE_TIME,self.token)#60 * 60 * 24 * 2 
  end

  def self.find_by_login_or_email field_value
    if field_value.include?('@')
      find_by_email(Email.downcase(field_value))
    else
      find_by_login(field_value)
    end
  end

  def password= pawd
    @raw_password = pawd
  end

  def ensure_password_is_encrypted
    return unless @raw_password

    self.salt = Utils::Password.random_salt(16)
    self.encrypted_password = encrypt_password(@raw_password, salt)
  end

  def password_right?(raw_password)
    return false unless encrypted_password && salt
    self.encrypted_password == Utils::Password.encrypt(raw_password, salt)
  end

  def encrypt_password(raw_password, salt)
    Utils::Password.encrypt(raw_password, salt)
  end

  def create_user_profile
    User::Profile.create(user_id: self.id)
  end

  def update_profile profile_params
    user_profile.update(profile_params)#####可以一个SQL语句完成
  end

end
