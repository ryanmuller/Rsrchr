class RefLink < ActiveRecord::Base
  belongs_to :user
  belongs_to :citation

  validates :user_id, :presence => true
  validates :user_id, :uniqueness => { :scope => :citation_id }

end
