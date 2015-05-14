TESTDIR = ".tests"
CONFIG  = File.join( Dir.pwd, "config/config.yml" )

def setup

  if Dir.exists?(ROOT)
    cleanup
  else

    FileUtils.mkdir(ROOT)
    puts "Successfully created directory #{ROOT}."

  end

end

def cleanup

  FileUtils.rm_rf(ROOT)
  puts "Successfully removed directory #{ROOT}."

end

def init_database

  m = "db/migrate"

end

def get_app

  return Rack::Builder.app do

    map "/api" do
      run Vibe::Api
    end

    map "/auth" do
      run Vibe::Auth
    end

  end

end

