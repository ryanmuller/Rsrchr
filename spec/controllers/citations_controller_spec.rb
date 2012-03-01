require 'spec_helper'

describe CitationsController do

  before(:each) do
    @user = FactoryGirl.create(:user)
    @a1 = "Kirschner, P.A."
    @citekey = "kirschner2006minimal"
    @title = "Why minimal guidance during instruction does not work: An analysis of the failure of constructivist, discovery, problem-based, experiential, and inquiry-based teaching"
    @t1 = "discovery learning"
    @bibtex = "@article{#{@citekey}, author = {#{@a1} and Sweller, J. and Clark, R.E.}, journal = {Educational psychologist}, keywords = {#{@t1}; constructivism}, number = {2}, pages = {75--86}, publisher = {Taylor \& Francis}, title = {#{@title}}, volume = {41}, year = {2006}}"
  end

  describe "POST 'create'" do

    it "should submit a citation by sending a citekey" do
      post :create, :bibtex => @bibtex, :token => @user.authentication_token
      Citation.first.citekey.should == @citekey
    end

    it "should not create a second citation when submitted twice" do
      post :create, :bibtex => @bibtex, :token => @user.authentication_token
      lambda do
        post :create, :bibtex => @bibtex, :token => @user.authentication_token
      end.should change(Citation, :count).by(0)
    end
  end
end


