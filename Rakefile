require "rake"
require "yaml"

require File.join( Dir.pwd, "lib", "vibe" )

env = "development"

namespace :api do

  desc "create apikey"
  task :create, [:name, :path] do |t, args|

    exit if args.path.nil? or args.name.nil?

    config = YAML.load_file(args.path)[env]
    ActiveRecord::Base.establish_connection config

    k = Vibe::Key.create(:name => args.name)
    puts "API-Key for #{args.name}: #{k.key}" unless k.nil?

  end

end

