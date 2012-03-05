require 'spec_helper'

describe PostingsController do

  before(:each) do
    @group = Factory(:group)
  end

  describe "access control" do

    it "should require signin for create" do
      post :create, :group_id => @group.id
      response.should redirect_to(new_user_session_path)
    end

    it "should require membership for create" do
      @user = Factory(:user)
      sign_in @user
      lambda do
        post :create, :group_id => @group.id
      end.should change(Posting, :count).by(0)
    end
  end

  describe "POST 'create'" do

    before(:each) do
      @user = Factory(:user)
      sign_in @user
      @user.join!(@group)
    end
    
    it "should create a posting" do
      lambda do 
        post :create, :group_id => @group.id, :posting => { :content => "hi there" }
        response.should be_redirect
      end.should change(Posting, :count).by(1)
    end

    it "should create a posting in the right group" do
      post :create, :group_id => @group.id, :posting => { :content => "hi there" }
      @group.postings.first.content.should == "hi there"
    end
  end
end
