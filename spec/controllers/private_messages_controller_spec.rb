require 'spec_helper'

describe PrivateMessagesController do

  describe "GET 'inbox'" do
    it "returns http success" do
      get 'inbox'
      response.should be_success
    end
  end

  describe "GET 'outbox'" do
    it "returns http success" do
      get 'outbox'
      response.should be_success
    end
  end

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      get 'show'
      response.should be_success
    end
  end

end
