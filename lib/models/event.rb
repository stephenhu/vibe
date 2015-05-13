module Vibe

  class Event < ActiveRecord::Base

    belongs_to :user

    has_many :invites, :dependent => :destroy
    has_many :comments, :dependent => :destroy
    has_many :photos, :dependent => :destroy
    has_many :ratings, :dependent => :destroy

  end

end

