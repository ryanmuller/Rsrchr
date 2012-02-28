class TagsController < ApplicationController
  def create
    @citation = Citation.find(params[:citation_id])
    @tag = Tag.find_by_name(params[:tag][:name]) || Tag.new(params[:tag])

    begin 
      @tag.citations << @citation
    rescue
      redirect_to @citation, :notice => 'Tag already added.'
      return
    end

    if @tag.save 
      redirect_to @citation, :notice => 'Tag created successfully.' 
    else
      redirect_to @citation, :notice => 'Could not add tag.'
    end
  end

  def show
    @tag = Tag.find_by_name(params[:name])
  end
end
