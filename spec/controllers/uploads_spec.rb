require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

describe Uploads, "index action" do
  before(:each) do
    dispatch_to(Uploads, :index)
  end
end