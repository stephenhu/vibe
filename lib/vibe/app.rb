module Vibe

  class App < Sinatra::Base
    include BCrypt, Helper

    configure do

      c1 = File.join( Dir.pwd, "config", "database.yml" )
      c2 = File.join( Dir.pwd, "config", "config.yml" )

      database  = YAML.load_file(c1)["development"]
      config    = YAML.load_file(c2)

      set :database, database
      set :config, config

      cipher = OpenSSL::Cipher::AES.new( 128, :CBC )
      cipher.encrypt

      cipher.key  = config["app"]["enckey"]
      cipher.iv   = config["app"]["enciv"]

      decipher = OpenSSL::Cipher::AES.new( 128, :CBC )
      decipher.decrypt

      decipher.key = config["app"]["enckey"]
      decipher.iv  = config["app"]["enciv"]

      set :cipher, cipher
      set :decipher, decipher

      ActiveRecord::Base.establish_connection database

      if not File.exists?(database["database"])

        m = File.join( Sinatra::Application.root, "..", "db/migrate" )

        ActiveRecord::Migration.verbose = false
        ActiveRecord::Migrator.migrate(m)

      end

    end

  end

end

