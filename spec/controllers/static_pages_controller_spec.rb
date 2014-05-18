require 'spec_helper'

describe StaticPagesController do

  describe "GET 'dashboard'" do
    it "returns http success" do
      get 'dashboard'
      response.should be_success
    end
  end

  describe "GET 'charts'" do
    it "returns http success" do
      get 'charts'
      response.should be_success
    end
  end

  describe "GET 'forms'" do
    it "returns http success" do
      get 'forms'
      response.should be_success
    end
  end

  describe "GET 'tables'" do
    it "returns http success" do
      get 'tables'
      response.should be_success
    end
  end

  describe "GET 'calender'" do
    it "returns http success" do
      get 'calender'
      response.should be_success
    end
  end

  describe "GET 'mailbox'" do
    it "returns http success" do
      get 'mailbox'
      response.should be_success
    end
  end

end
