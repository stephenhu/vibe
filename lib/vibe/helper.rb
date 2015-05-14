module Vibe

  module Helper

    def authorized_as_admin?

      admin     = params[:admin]
      password  = params[:password]

      halt 401 if admin.nil? or password.nil?
      halt 401 if settings.config["app"]["admin"] != admin
      halt 401 if settings.config["app"]["password"] != password

    end

    def authorized?

      apikey  = params[:apikey]

      halt 401 if apikey.nil? or apikey.empty?

      k = Key.find_by_key(apikey)

      halt 401 if k.nil?
 
    end

  end

end

