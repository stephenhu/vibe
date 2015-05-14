module Vibe

  module Helper

    def check_authorization?

      email     = params[:email]
      apikey    = params[:apikey]

      halt 401 if email.nil? or apikey.nil?
      halt 401 if settings.email != email
      halt 401 if settings.apikey != apikey

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

