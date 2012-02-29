class TagsController < ApplicationController
  def create
    @citation = Citation.find(params[:citation_id])
    @tag = Tag.find_by_name(params[:tag][:name]) || Tag.create(params[:tag])
    if Tagging.where("user_id = ? AND tag_id = ? AND citation_id = ?", current_user.id, @tag.id, @citation.id).count > 0
      redirect_to @citation, :notice => 'Could not add tag.'
    else 
      @citation.tags.push_with_attributes(@tag, :user => current_user)
      redirect_to @citation, :notice => 'Tag created successfully.' 
    end
  end

  def show
    @tag = Tag.find_by_name(params[:name])
  end
end
