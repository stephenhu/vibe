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

  it "creates user" do


  end

  it "gets user" do
  end

end

