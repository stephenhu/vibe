require File.join( Dir.pwd, "lib", "vibe" )

map "/admin" do
  run Vibe::Admin
end

map "/api" do
  run Vibe::Api
end

map "/auth" do
  run Vibe::Auth
end

