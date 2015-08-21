require 'utils'
class User < ActiveRecord::Base

  before_save :ensure_password_is_encrypted

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

  def token
    $redis.get("#{TOKEN_KEY_PREFIX}#{self.id}")#60 * 60 * 24 * 2 
  end

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

end
