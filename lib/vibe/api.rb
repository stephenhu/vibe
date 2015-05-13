module Vibe

  class Api < App

    get "/version" do
      return { :status => "200", :msg => "v1" }.to_json
    end

    get "/users/:id" do
    end

    post "/users" do
    end

    put "/users/:id" do
    end

    delete "/users/:id" do
    end

    get "/users/:uid/contacts/:cid" do
    end

    post "/users/:id/contacts" do
    end

    put "/users/:uid/contacts/:id" do
    end

    delete "/users/:uid/contacts/:id" do
    end

    get "/events/:id" do
    end

    post "/events" do
    end

    put "/events/:id" do
    end

    delete "/events/:id" do
    end

    get "/events/:eid/invites/:id" do
    end

    post "/events/:id/invites" do
    end

    put "/events/:eid/invites/:id" do
    end

    delete "/events/:eid/invites/:id" do
    end

    get "/events/:eid/photos/:id" do
    end

    post "/events/:id/photos" do
    end

    put "/events/:eid/photos/:id" do
    end

    delete "/events/:eid/photos/:id" do
    end

    get "/events/:eid/comments/:id" do
    end

    post "/events/:id/comments" do
    end

    put "/events/:eid/comments/:id" do
    end

    delete "/events/:eid/comments/:id" do
    end

    get "/events/:eid/ratings/:id" do
    end

    post "/events/:id/ratings" do
    end

    put "/events/:eid/ratings/:id" do
    end

    delete "/events/:eid/ratings/:id" do
    end

  end

end

