module Vibe

  class Rating < ActiveRecord::Base

    belongs_to :user
    belongs_to :event

  end

end

