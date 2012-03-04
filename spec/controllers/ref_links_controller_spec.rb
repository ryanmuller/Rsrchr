require 'spec_helper'

describe RefLinksController do

  before(:each) do
    @user = FactoryGirl.create(:user)
    @citation = FactoryGirl.create(:citation)
    @url = "http://localhost/ref:#{@citation.citekey}"
  end

  describe "POST 'create'" do

    it "should submit a reflink by sending a citekey and url" do
      post :create, :citekey => @citation.citekey, :reflink => { :url => @url }, :token => @user.authentication_token
      RefLink.first.citation.should == @citation
    end

    it "should not create a second reflink when submitted twice" do
      post :create, :citekey => @citation.citekey, :reflink => { :url => @url }, :token => @user.authentication_token
      lambda do
        post :create, :citekey => @citation.citekey, :reflink => { :url => @url }, :token => @user.authentication_token
      end.should change(RefLink, :count).by(0)
    end
  end
end


