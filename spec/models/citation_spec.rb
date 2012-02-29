require 'spec_helper'

describe Citation do

  before(:each) do
    #citation_attrs = FactoryGirl.attributes_for(:citation)
    @user = Factory(:user)
  end


  describe "when creating from bibtex" do

    before(:each) do
      @a1 = "Kirschner, P.A."
      @citekey = "kirschner2006minimal"
      @t1 = "discovery learning"
      @bibtex = "@article{#{@citekey}, author = {#{@a1} and Sweller, J. and Clark, R.E.}, journal = {Educational psychologist}, keywords = {#{@t1}; constructivism}, number = {2}, pages = {75--86}, publisher = {Taylor \& Francis}, title = {Why minimal guidance during instruction does not work: An analysis of the failure of constructivist, discovery, problem-based, experiential, and inquiry-based teaching}, volume = {41}, year = {2006}}"
    end

    it "should be able to create a citation from bibtex" do
      lambda do
        @citation = Citation.create_from_bibtex(@bibtex)
      end.should change(Citation, :count).by(1)
    end

    it "should have the right citekey" do
      @citation = Citation.create_from_bibtex(@bibtex)
      @citation.citekey.should == @citekey
    end
      
    it "should create a related author" do
      @citation = Citation.create_from_bibtex(@bibtex)
      author = Author.find_by_name(@a1)
      author.should_not be_nil
      @citation.authors.should include(author)
    end

    it "should create related tags" do
      @citation = Citation.create_from_bibtex(@bibtex, @user)
      tag = Tag.find_by_name(@t1)
      tag.should_not be_nil
      tag.taggings.find_by_user_id(@user.id).should_not be_nil
      @citation.tags.should include(tag)
    end
  end
end
