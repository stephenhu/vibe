TESTDIR   = ".tests"
ROOT      = File.join( Dir.pwd, TESTDIR )
DB        = File.join( Dir.pwd, TESTDIR, "vibe.db" )
CONFIG    = File.join( Dir.pwd, TESTDIR, "config.yml" )
DBCONFIG  = File.join( Dir.pwd, TESTDIR, "database.yml" )

CONFIG_TEMPLATE     = File.join( Dir.pwd, "config", "config.yml.erb" )
DATABASE_TEMPLATE   = File.join( Dir.pwd, "config", "database.yml.erb" )

def setup

  cleanup if Dir.exists?(ROOT)

  FileUtils.mkdir(ROOT)

  generate_configs
  generate_database

end

def cleanup

  FileUtils.rm_rf(ROOT)

end

def generate_configs

  path = DB

  database = ERB.new(File.read(DATABASE_TEMPLATE))
  contents1 = database.result(binding)

  file1 = File.open( DBCONFIG, "w" )
  file1.write(contents1)
  file1.close

  enckey    = SecureRandom::hex(32)
  enciv     = SecureRandom::hex(32)
  admin     = "admin"
  password  = "test"

  config = ERB.new(File.read(CONFIG_TEMPLATE))
  contents2 = config.result(binding)

  file2 = File.open( CONFIG, "w" )
  file2.write(contents2)
  file2.close

end

def connect_database

  db = YAML.load_file(DBCONFIG)["development"]
  ActiveRecord::Base.establish_connection db

end

def generate_key(email)

  connect_database

  k = Vibe::Key.find_or_create_by(:email => email)

  return nil if k.nil?

  return k.key unless k.nil?

end

def generate_database

  m = "db/migrate"

  connect_database

  ActiveRecord::Migration.verbose = false
  ActiveRecord::Migrator.migrate(m)

end

def get_app

  return Rack::Builder.app do

    map "/admin" do
      run Vibe::Admin
    end

    map "/api" do
      run Vibe::Api
    end

    map "/auth" do
      run Vibe::Auth
    end

  end

end

