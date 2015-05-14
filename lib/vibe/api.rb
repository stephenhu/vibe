module Vibe

  class Api < App

    get "/version" do
      return { :status => "200", :msg => "v1" }.to_json
    end

    get "/users/:id" do

      halt 401 if not authorized?

      id = params[:id]

      halt 404 if id.nil?

      u = User.find_by_id(id)

      halt 404 if u.nil?

      puts u.inspect

      return { :status => "200", :msg => "v1" }.to_json

    end

    post "/users" do

      halt 401 if not authorized?

      name      = params[:name]
      password  = params[:password]
      mobile    = params[:mobile]

      halt 400 if name.nil? or password.nil? or mobile.nil?

      u = User.create(
        :name => name,
        :password => password,
        :mobile => mobile
      )

      return { :status => "200", :msg => "" }.to_json

    end

    put "/users/:id" do
      return { :status => "200", :msg => "v1" }.to_json
    end

    delete "/users/:id" do
      return { :status => "200", :msg => "v1" }.to_json
    end

    get "/users/:uid/contacts/:cid" do
      return { :status => "200", :msg => "v1" }.to_json
    end

    post "/users/:id/contacts" do
      return { :status => "200", :msg => "v1" }.to_json
    end

    put "/users/:uid/contacts/:id" do
      return { :status => "200", :msg => "v1" }.to_json
    end

    delete "/users/:uid/contacts/:id" do
      return { :status => "200", :msg => "v1" }.to_json
    end

    get "/events/:id" do
      return { :status => "200", :msg => "v1" }.to_json
    end

    post "/events" do
      return { :status => "200", :msg => "v1" }.to_json
    end

    put "/events/:id" do
      return { :status => "200", :msg => "v1" }.to_json
    end

    delete "/events/:id" do
      return { :status => "200", :msg => "v1" }.to_json
    end

    get "/events/:eid/invites/:id" do
      return { :status => "200", :msg => "v1" }.to_json
    end

    post "/events/:id/invites" do
      return { :status => "200", :msg => "v1" }.to_json
    end

    put "/events/:eid/invites/:id" do
      return { :status => "200", :msg => "v1" }.to_json
    end

    delete "/events/:eid/invites/:id" do
      return { :status => "200", :msg => "v1" }.to_json
    end

    get "/events/:eid/photos/:id" do
      return { :status => "200", :msg => "v1" }.to_json
    end

    post "/events/:id/photos" do
      return { :status => "200", :msg => "v1" }.to_json
    end

    put "/events/:eid/photos/:id" do
      return { :status => "200", :msg => "v1" }.to_json
    end

    delete "/events/:eid/photos/:id" do
      return { :status => "200", :msg => "v1" }.to_json
    end

    get "/events/:eid/comments/:id" do
      return { :status => "200", :msg => "v1" }.to_json
    end

    post "/events/:id/comments" do
      return { :status => "200", :msg => "v1" }.to_json
    end

    put "/events/:eid/comments/:id" do
      return { :status => "200", :msg => "v1" }.to_json
    end

    delete "/events/:eid/comments/:id" do
      return { :status => "200", :msg => "v1" }.to_json
    end

    get "/events/:eid/ratings/:id" do
      return { :status => "200", :msg => "v1" }.to_json
    end

    post "/events/:id/ratings" do
      return { :status => "200", :msg => "v1" }.to_json
    end

    put "/events/:eid/ratings/:id" do
      return { :status => "200", :msg => "v1" }.to_json
    end

    delete "/events/:eid/ratings/:id" do
      return { :status => "200", :msg => "v1" }.to_json
    end

  end

end

