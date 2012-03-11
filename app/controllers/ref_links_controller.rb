class RefLinksController < ApplicationController
  before_filter :authenticate_user, :only => :create

  def show
    @citation = Citation.find(params[:citation_id])
    @ref_link = RefLink.find(params[:id])

    require 'nokogiri'
    require 'open-uri' 

    doc = Nokogiri::HTML(open(@ref_link.url))
    @summary = doc.xpath("//div[contains(@class, \"notes:#{@citation.citekey}\")]").first.to_s.html_safe
  end

  def create
    @ref_link = RefLink.new(params[:ref_link])
    @citation = @ref_link.citation || Citation.find_in_params(params)
    @ref_link.citation = @citation
    @ref_link.user = @current_user

    
    respond_to do |format|
      if @ref_link.save
        format.html { redirect_to @citation, notice: 'Reference link was successfully created.' }
        format.json { render json: @ref_link, status: :created, location: @citation }
      else
        format.html { redirect_to @citation, error: 'Could not create reference link.' }
        format.json { render json: @ref_link.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  
  def authenticate_user
    @current_user = User.find_by_authentication_token(params[:token])
  end
end
