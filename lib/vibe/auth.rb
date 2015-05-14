module Vibe

  class Auth < App

    post "/" do

      username  = params[:username]
      password  = params[:password]

      halt 403 if username.empty? or password.empty?

      if authenticate( username, password )

        token = create_token(username)

        response.set_cookie( "vibe", { :value => token,
          :path => "/", :expires => Time.now + 24 * 3 * 3600 } )

        return {:status => "200", :msg => ""}.to_json

      else
        halt 403
      end

    end

    delete "/" do

      response.delete_cookie( "vibe", :path => "/" )

      return {:status => "200", :msg => ""}.to_json

    end

  end

end

