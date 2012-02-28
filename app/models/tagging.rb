class Tagging < ActiveRecord::Base
  belongs_to :user
  belongs_to :tag
  belongs_to :citation

  validates :tag_id, :uniqueness => { :scope => [:user_id, :citation_id] }
end
