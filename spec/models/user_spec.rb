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

    describe "leave! function" do

      it "should remove a user from a group" do
        @user.join!(@group)
        @user.leave!(@group)
        @user.should_not be_member(@group)
      end
    end

    describe "member? function" do

      it "should be nil when a user has not joined a group" do
        @user.member?(@group).should == nil
      end

      it "should return a membership when a user is in a group" do
        @user.join!(@group)
        @user.member?(@group).should_not == nil
      end
    end
  end
end
