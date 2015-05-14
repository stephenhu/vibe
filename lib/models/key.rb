module Vibe

  class Key < ActiveRecord::Base

    validates_uniqueness_of :email
    validates_uniqueness_of :key

    before_create :generate_key

    def generate_key

      text = self.email + SecureRandom.hex(32) + Time.now.to_s

      self.key = Digest::SHA256.hexdigest(text)
 
    end

  end

end

