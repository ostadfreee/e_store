require 'spec_helper'

describe PublicController do

  describe "GET 'list'" do
    it "returns http success" do
      get 'list'
      response.should be_success
    end
  end

end
