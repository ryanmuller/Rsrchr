require 'spec_helper'

describe MembershipsController do

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
      @group = Factory(:group)
    end
    
    it "should create a membership" do
      lambda do
        post :create, :membership => { :group_id => @group.id }
        response.should be_redirect
      end.should change(Membership, :count).by(1)
    end
  end

  describe "DELETE 'destroy'" do

    before(:each) do
      @user = Factory(:user)
      sign_in @user
      @group = Factory(:group)
      @user.join!(@group)
      @membership = @user.memberships.find_by_group_id(@group)
    end

    it "should destroy a membership" do
      lambda do 
        delete :destroy, :id => @membership
        response.should be_redirect
      end.should change(Membership, :count).by(-1)
    end
  end
end
