require 'spec_helper'

describe GroupsController do

  def valid_attributes
    FactoryGirl.attributes_for(:group)
  end
  
  describe "access control" do

    it "should require signin for create" do
      post :create, :group => valid_attributes
      response.should redirect_to(new_user_session_path)
    end

  end

  describe "admin control" do
    before(:each) do
      @user = Factory(:user)
      sign_in @user
      @group = Factory(:group)
    end

    it "should require group admin for destroy" do
      lambda do
        delete :destroy, :id => @group.id
      end.should change(Group, :count).by(0)

      response.should redirect_to(groups_path)
    end

    it "should require group admin for update" do 
      lambda do
         put :update, :group => valid_attributes, :id => @group.id
      end.should change(Group, :count).by(0)

      response.should redirect_to(groups_path)
    end
  end


  describe "GET index" do
    it "assigns all groups as @groups" do
      group = Group.create! valid_attributes
      get :index, {}
      assigns(:groups).should eq([group])
    end
  end

  describe "GET show" do
    it "assigns the requested group as @group" do
      group = Group.create! valid_attributes
      get :show, {:id => group.to_param}
      assigns(:group).should eq(group)
    end
  end

  describe "GET new" do
    before(:each) do
      sign_in FactoryGirl.create(:user)
    end

    it "assigns a new group as @group" do
      get :new, {}
      assigns(:group).should be_a_new(Group)
    end
  end

  describe "GET edit" do
    before(:each) do 
      sign_in FactoryGirl.create(:user)
    end

    it "assigns the requested group as @group" do
      group = Group.create! valid_attributes
      get :edit, {:id => group.to_param}
      assigns(:group).should eq(group)
    end
  end

  describe "POST create" do
    before(:each) do
      sign_in FactoryGirl.create(:user)
    end

    describe "with valid params" do
      it "creates a new Group" do
        expect {
          post :create, {:group => valid_attributes}
        }.to change(Group, :count).by(1)
      end

      it "assigns a newly created group as @group" do
        post :create, {:group => valid_attributes}
        assigns(:group).should be_a(Group)
        assigns(:group).should be_persisted
      end

      it "redirects to the created group" do
        post :create, {:group => valid_attributes}
        response.should redirect_to(Group.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved group as @group" do
        # Trigger the behavior that occurs when invalid params are submitted
        Group.any_instance.stub(:save).and_return(false)
        post :create, {:group => {}}
        assigns(:group).should be_a_new(Group)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Group.any_instance.stub(:save).and_return(false)
        post :create, {:group => {}}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    before(:each) do
      sign_in FactoryGirl.create(:user)
      post :create, :group => valid_attributes
      @group = Group.first
    end

    describe "with valid params" do
      it "updates the requested group" do
        Group.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => @group.to_param, :group => {'these' => 'params'}}
      end

      it "assigns the requested group as @group" do
        put :update, {:id => @group.to_param, :group => valid_attributes}
        assigns(:group).should eq(@group)
      end

      it "redirects to the group" do
        put :update, {:id => @group.to_param, :group => valid_attributes}
        response.should redirect_to(@group)
      end
    end

    describe "with invalid params" do
      it "assigns the group as @group" do
        # Trigger the behavior that occurs when invalid params are submitted
        Group.any_instance.stub(:save).and_return(false)
        put :update, {:id => @group.to_param, :group => {}}
        assigns(:group).should eq(@group)
      end

      it "re-renders the 'edit' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Group.any_instance.stub(:save).and_return(false)
        put :update, {:id => @group.to_param, :group => {}}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do

    before(:each) do
      sign_in FactoryGirl.create(:user)
      post :create, :group => valid_attributes
      @group = Group.first
    end

    it "destroys the requested group" do
      expect {
        delete :destroy, {:id => @group.id}
      }.to change(Group, :count).by(-1)
    end

    it "redirects to the groups list" do
      delete :destroy, {:id => @group.id}
      response.should redirect_to(groups_url)
    end
  end

end
