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

  it "create key for existing email" do

    post "/admin/keys", :email => "test@test.com", :admin => "admin",
      :password => "test"

    expect(last_response).to be_ok

  end

  it "create key with wrong password should fail" do

    params = {
      :email => "anonymous@test.com",
      :admin => "admin",
      :password => "wrongpassword"
    }

    post "/admin/keys", :email => "test@test.com", :admin => "admin",
      :password => "wrongpassword"

    expect(last_response.status).to eq(401)

  end

end

