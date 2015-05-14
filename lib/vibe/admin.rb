module Vibe

  class Admin < App

    get "/version" do
      return { :status => "200", :msg => "1" }.to_json
    end

    get "/keys/:id" do

      check_authorization?

      id = params[:id]

      halt 404 if id.nil?

      k = Key.find_by_email(id)

      halt 404 if k.nil?

      return {:status => "200", :msg => "#{k.key}"}.to_json

    end

    post "/keys" do

      check_authorization?

      email         = params[:email]
      #permissions   = params[:permissions]

      halt 400 if email.nil?

      k = Key.find_or_create_by(:email => email)

      return {:status => "200", :msg => "#{k.key}"}.to_json

    end

    put "/keys/:id" do

      check_authorization?

      id          = params[:id]
      email       = params[:email]
      permissions = params[:permissions]

      halt 404 if id.nil?

      k = Key.find_by_email(id)

      halt 404 if k.nil?

      k.update(
        :email => email,
        :permissions => permission
      )

      return {:status => "200", :msg => ""}.to_json

    end

    # id is an email address
    delete "/keys/:id" do

      check_authorization?

      id = params[:id]

      halt 400 if id.nil?

      k = Key.find_by_email(id)

      halt 404 if k.nil?

      k.destroy

      return {:status => "200", :msg => ""}.to_json

    end

  end

end

