require "active_record"
require "base64"
require "bcrypt"
require "digest"
require "securerandom"
require "sinatra"
require "sqlite3"
require "thin"
require "yaml"

require File.join( Sinatra::Application.root, "models", "key" )
require File.join( Sinatra::Application.root, "models", "user" )
require File.join( Sinatra::Application.root, "models", "contact" )
require File.join( Sinatra::Application.root, "models", "event" )
require File.join( Sinatra::Application.root, "models", "photo" )
require File.join( Sinatra::Application.root, "models", "invite" )
require File.join( Sinatra::Application.root, "models", "rating" )
require File.join( Sinatra::Application.root, "models", "comment" )

require File.join( Sinatra::Application.root, "vibe", "helper" )
require File.join( Sinatra::Application.root, "vibe", "app" )
require File.join( Sinatra::Application.root, "vibe", "admin" )
require File.join( Sinatra::Application.root, "vibe", "api" )
require File.join( Sinatra::Application.root, "vibe", "auth" )
require File.join( Sinatra::Application.root, "vibe", "version" )

module Vibe

  SALT    = "raininspain".freeze

end

