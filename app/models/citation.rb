class Citation < ActiveRecord::Base
  has_many :scrobbles
  has_many :pdfhashes
  has_many :ref_links
  has_many :taggings
  has_many :tags, :uniq => true, :through => :taggings do
    def push_with_attributes(tag, join_attrs)
      Tagging.with_scope(:create => join_attrs) { self << tag }
    end
  end

  def self.find_in_params(params)
    c1 = Citation.find_by_doi(params[:doi]) unless params[:doi].nil?
    c2 = Citation.find_by_citekey(params[:citekey]) unless params[:citekey].nil?
    c3 = Pdfhash.find_by_hashkey(params[:hashkey]).citation unless params[:hashkey].nil?

    return c1 || c2 || c3
  end
end
