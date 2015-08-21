module Utils

  class Password

    class << self
      def encrypt(raw_data, salt = nil)
        require 'openssl' unless defined?(OpenSSL)
        OpenSSL::HMAC.hexdigest(OpenSSL::Digest::SHA1.new, salt || random_salt, raw_data.to_s)
      end

      def random_salt(size = 64)
        SecureRandom.hex(size)
      end
    end

  end

  def self.generate_uuid size=32
    SecureRandom.hex(size)
  end

end