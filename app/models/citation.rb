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
  has_many :authorships
  has_many :authors, :through => :authorships

  belongs_to :user

  validates :title, :presence => true
  validates :citekey, :uniqueness => true
  validates :user_id, :presence => true

  def self.find_in_params(params)
    c1 = Citation.find_by_doi(params[:doi]) unless params[:doi].nil?
    c2 = Citation.find_by_citekey(params[:citekey]) unless params[:citekey].nil?
    c3 = Pdfhash.find_by_hashkey(params[:hashkey]).citation unless params[:hashkey].nil?

    return c1 || c2 || c3
  end

  def self.create_from_bibtex(bibtex, submitter)

    require 'bibtex'
    bib = BibTeX.parse(bibtex).first
    citekey = bib.key.to_s
    title = bib.title.to_s.gsub(/^{/, '').gsub(/}$/, '')
    doi = bib[:DOI]

    citation = Citation.create(:bibtex => bibtex, 
                               :citekey => citekey,
                               :title => title,
                               :doi => doi,
                               :user_id => submitter.id)

    # add authors
    bib.author.each do |author|
      author_name = author.to_s
      a = Author.find_by_name(author_name) || Author.create(:name => author_name)
      citation.authors << a
    end

    # add keywords as tags
    if bib.has_field?(:keywords)
      bib.keywords.to_s.split(";").each do |tag|
        tag_name = tag.strip
        next if tag_name.empty?
        t = Tag.find_by_name(tag_name) || Tag.create(:name => tag_name)
        citation.tags.push_with_attributes(t, :user => submitter)
      end
    end

    return citation
  end
                                
  def citekey_url
    "/ref:#{citekey}"
  end

end
