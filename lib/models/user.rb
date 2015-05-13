module Vibe

  class User < ActiveRecord::Base
    include BCrypt

    has_many :contacts
    has_many :comments
    has_many :photos
    has_many :events
    has_many :ratings
 
    validates_uniqueness_of :name
    validates_uniqueness_of :mobile

    before_create :hash_password

    def hash_password
      self.password = Password.create(self.password)
    end

  end

end

