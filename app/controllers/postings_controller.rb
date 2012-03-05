class PostingsController < ApplicationController

  before_filter :find_group, :authenticate_user_for_group

  def create
    @posting = @group.postings.build(params[:posting])
    @posting.user = current_user

    if @posting.save
      redirect_to @group
    else
      redirect_to @group, error: "Could not create post."
    end
  end

  protected

  def find_group
    @group = Group.find(params[:group_id])
  end

  def authenticate_user_for_group
    authenticate_user!
    if not current_user.member?(@group)
      redirect_to @group, error: "You are not a member of this group."
      return
    end
  end
end
