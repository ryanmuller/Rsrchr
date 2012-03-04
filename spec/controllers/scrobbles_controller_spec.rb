require 'spec_helper'

describe ScrobblesController do

  before(:each) do
    @user = FactoryGirl.create(:user)
    @citation = FactoryGirl.create(:citation)
    @pdfhash = FactoryGirl.create(:pdfhash, :citation => @citation)
    @params = { :user_id => @user.id }
  end


  describe "POST 'create'" do

    it "should scrobble a citation by sending a citekey" do
      post :create, :scrobble => @params, :citekey => @citation.citekey, :token => @user.authentication_token
      Scrobble.first.citation.should == @citation
    end

    it "should scrobble a citation by sending a doi" do
      post :create, :scrobble => @params, :doi => @citation.doi, :token => @user.authentication_token
      Scrobble.first.citation.should == @citation
    end

    it "should scrobble a citation by sending a pdfhash" do
      post :create, :scrobble => @params, :hashkey => @pdfhash.hashkey, :token => @user.authentication_token
      Scrobble.first.citation.should == @citation
    end
  end
end
