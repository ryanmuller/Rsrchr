require 'spec_helper'

describe UserCitationsController do

  describe "access control" do

    it "should require signin for create" do
      post :create
      response.should redirect_to(new_user_session_path)
    end

    it "should require signin for destroy" do
      delete :destroy, :id => 1
      response.should redirect_to(new_user_session_path)
    end
  end

  describe "POST 'create'" do

    before(:each) do
      @user = Factory(:user)
      sign_in @user
      @citation = Factory(:citation)
    end
    
    it "should create a user_citation" do
      lambda do
        post :create, :user_citation => { :citation_id => @citation.id }
        response.should be_redirect
      end.should change(UserCitation, :count).by(1)
    end
  end

  describe "DELETE 'destroy'" do

    before(:each) do
      @user = Factory(:user)
      sign_in @user
      @citation = Factory(:citation)
      @user.add_citation!(@citation)
      @user_citation = @user.user_citations.find_by_citation_id(@citation)
    end

    it "should destroy a membership" do
      lambda do 
        delete :destroy, :id => @user_citation.id
        response.should be_redirect
      end.should change(UserCitation, :count).by(-1)
    end
  end
end

