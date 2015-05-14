module Vibe

  module Helper

    def check_authorization?

      admin     = params[:admin]
      password  = params[:password]

      halt 401 if admin.nil? or password.nil?
      halt 401 if settings.config["app"]["admin"] != admin
      halt 401 if settings.config["app"]["password"] != password

    end

    def authorized?

      apikey  = params[:apikey]
      appname = params[:appname]

      return false if apikey.nil? or apikey.empty?
      return false if appname.nil? or appname.empty?

      k = Key.find_by_key(apikey)

      return false if k.nil?
 
      k.name != appname ? false : true
      
    end

  end

end

