require File.join( Dir.pwd, "lib", "vibe" )

map "/api" do
  run Vibe::Api
end

map "/auth" do
  run Vibe::Auth
end

