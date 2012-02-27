class TagsController < ApplicationController
  def create
    @citation = Citation.find(params[:citation_id])
    @tag = Tag.new(params[:tag])
    @tag.citations << @citation

    if @tag.save 
      redirect_to @citation, :notice => 'Tag created successfully.' 
    else
      redirect_to @citation, :notice => 'Could not add tag.'
    end
  end

  def show
    @tag = Tag.find(params[:id])
  end
end
