class PdfhashesController < ApplicationController
  # GET /pdfhashes
  # GET /pdfhashes.json
  def index
    @pdfhashes = Pdfhash.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pdfhashes }
    end
  end

  # GET /pdfhashes/1
  # GET /pdfhashes/1.json
  def show
    @pdfhash = Pdfhash.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pdfhash }
    end
  end

  # GET /pdfhashes/new
  # GET /pdfhashes/new.json
  def new
    @pdfhash = Pdfhash.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pdfhash }
    end
  end

  # GET /pdfhashes/1/edit
  def edit
    @pdfhash = Pdfhash.find(params[:id])
  end

  # POST /pdfhashes
  # POST /pdfhashes.json
  def create
    @pdfhash = Pdfhash.new(params[:pdfhash])

    respond_to do |format|
      if @pdfhash.save
        format.html { redirect_to @pdfhash, notice: 'Pdfhash was successfully created.' }
        format.json { render json: @pdfhash, status: :created, location: @pdfhash }
      else
        format.html { render action: "new" }
        format.json { render json: @pdfhash.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pdfhashes/1
  # PUT /pdfhashes/1.json
  def update
    @pdfhash = Pdfhash.find(params[:id])

    respond_to do |format|
      if @pdfhash.update_attributes(params[:pdfhash])
        format.html { redirect_to @pdfhash, notice: 'Pdfhash was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pdfhash.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pdfhashes/1
  # DELETE /pdfhashes/1.json
  def destroy
    @pdfhash = Pdfhash.find(params[:id])
    @pdfhash.destroy

    respond_to do |format|
      format.html { redirect_to pdfhashes_url }
      format.json { head :no_content }
    end
  end
end
