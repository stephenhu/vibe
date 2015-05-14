require "rack/test"
require "rspec"

require "spec_helper"

require "vibe"

describe "API" do
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

  let(:key) { generate_key("test@test.com") }

  it "creates user" do

    expect(key)

    post "/api/users", :apikey => key, :name => "user1", :password => "abcde",
      :mobile => "18888888888"

    expect(last_response).to be_ok
      
  end

  it "fails to create empty user" do

    expect(key)

    post "/api/users", :apikey => key, :name => "", :password => "abcde",
      :mobile => "18888888888"

    expect(last_response.status).to eq(400)

  end

  it "fails to create nil user" do

    expect(key)

    post "/api/users", :apikey => key, :name => nil, :password => "abcde",
      :mobile => "18888888888"

    expect(last_response.status).to eq(400)

  end

  it "fails to create empty password" do

    expect(key)

    post "/api/users", :apikey => key, :name => "user1", :password => "",
      :mobile => "18888888888"

    expect(last_response.status).to eq(400)

  end

  it "fails to create nil password" do

    expect(key)

    post "/api/users", :apikey => key, :name => "user1", :password => nil,
      :mobile => "18888888888"

    expect(last_response.status).to eq(400)

  end

  it "fails to create empty mobile" do

    expect(key)

    post "/api/users", :apikey => key, :name => "user1", :password => "abcde",
      :mobile => ""

    expect(last_response.status).to eq(400)

  end

  it "fails to create nil mobile" do

    expect(key)

    post "/api/users", :apikey => key, :name => "", :password => "abcde",
      :mobile => nil

    expect(last_response.status).to eq(400)

  end

  it "gets user" do

    expect(key)

    get "/api/users/user1", :apikey => key

    expect(last_response).to be_ok

  end

end

