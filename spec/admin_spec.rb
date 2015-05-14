require "rack/test"
require "rspec"

require "spec_helper"

require "vibe"

describe "Admin API" do
  include Rack::Test::Methods

  before(:all) do
    setup
  end

  after(:all) do
    cleanup
  end

  def app
    @app = get_app
  end

  it "creates key" do

    post "/admin/keys", :email => "test@test.com", :admin => "admin",
      :password => "test"

    expect(last_response).to be_ok

  end

  it "gets key" do

    get "/admin/keys/test@test.com", :admin => "admin", :password => "test"

    expect(last_response).to be_ok

  end

  it "create key for existing email" do

    get "/admin/keys/test@test.com", :admin => "admin", :password => "test"

    expect(last_response).to be_ok

    key = JSON.parse(last_response.body)["msg"]

    post "/admin/keys", :email => "test@test.com", :admin => "admin",
      :password => "test"

    expect(last_response).to be_ok

    expect(JSON.parse(last_response.body)["msg"]).to eq(key)

  end

  it "create key with wrong password should fail" do

    post "/admin/keys", :email => "test@test.com", :admin => "admin",
      :password => "wrongpassword"

    expect(last_response.status).to eq(401)

  end

  it "create key with wrong admin account should fail" do

    post "/admin/keys", :email => "test@test.com", :admin => "wrongadmin",
      :password => "test"

    expect(last_response.status).to eq(401)

  end

  it "nil admin and password does not result in server error" do

    get "/admin/keys/test@test.com"

    expect(last_response.status).to eq(401)

  end

  it "admin empty string does not result in server error" do

    get "/admin/keys/test@test.com", :admin => "", :password => "test"

    expect(last_response.status).to eq(401)

  end

end

