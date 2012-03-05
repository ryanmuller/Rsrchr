class GroupsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  before_filter :authenticate_admin, :only => [:update, :destroy]

  # GET /groups
  def index
    @groups = Group.all
  end

  # GET /groups/1
  def show
    @group = Group.find(params[:id])
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit
    @group = Group.find(params[:id])
  end

  # POST /groups
  def create
    @group = Group.new(params[:group])

    if @group.save
      @group.users.push_with_attributes(current_user, :status => "admin")
      redirect_to @group, notice: 'Group was successfully created.' 
    else
      render action: "new" 
    end
  end

  # PUT /groups/1
  def update
    @group = Group.find(params[:id])

    if @group.update_attributes(params[:group])
      redirect_to @group, notice: 'Group was successfully updated.' 
    else
      render action: "edit" 
    end
  end

  # DELETE /groups/1
  def destroy
    @group = Group.find(params[:id])
    @group.destroy

    redirect_to groups_url
  end

  protected

  def authenticate_admin
    membership = current_user.memberships.find_by_group_id(params[:id])
    if membership.nil? || membership.status != "admin"
      redirect_to groups_path 
    end
  end
end
