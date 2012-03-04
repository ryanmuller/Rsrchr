require 'spec_helper'

describe User do

  describe "memberships" do

    before(:each) do
      @group = Factory(:group)
      @user = Factory(:user)
    end

    describe "join! function" do

      it "should put a user in a group" do
        @user.join!(@group)
        @group.users.should include(@user)
      end
    end

    describe "member? function" do

      it "should return false when a user has not joined a group" do
        @user.member?(@group).should == false
      end

      it "should return true when a user is in a group" do
        @user.join!(@group)
        @user.member?(@group).should == true
      end
    end
  end
end
