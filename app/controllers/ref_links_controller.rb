class RefLinksController < ApplicationController

  def create
    @ref_link = RefLink.new(params[:ref_link])
    @citation = @ref_link.citation || Citation.find_in_params(params)
    @ref_link.citation = @citation

    
    respond_to do |format|
      if @ref_link.save
        format.html { redirect_to @citation, notice: 'Reference link was successfully created.' }
        format.json { render json: @ref_link, status: :created, location: @citation }
      else
        format.html { render action: "new" }
        format.json { render json: @ref_link.errors, status: :unprocessable_entity }
      end
    end
  end
end
