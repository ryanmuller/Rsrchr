class RefLinksController < ApplicationController

  def create
    @ref_link = RefLink.new(params[:ref_link])
    if @ref_link.citation.nil?
      if not params[:hashkey].nil?
        citation = Pdfhash.find_by_hashkey(params[:hashkey]) 
      elsif not params[:citekey].nil?
        citation = Citation.find_by_citekey(params[:citekey])
      elsif not params[:doi].nil?
        citation = Citation.find_by_doi(params[:doi])
      end
      @ref_link.citation = citation
    end

    respond_to do |format|
      if @ref_link.save
        format.html { redirect_to @ref_link, notice: 'Reference link was successfully created.' }
        format.json { render json: @ref_link, status: :created, location: @ref_link }
      else
        format.html { render action: "new" }
        format.json { render json: @ref_link.errors, status: :unprocessable_entity }
      end
    end
  end
end
