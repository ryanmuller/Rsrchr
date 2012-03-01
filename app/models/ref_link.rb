class RefLink < ActiveRecord::Base
  belongs_to :user
  belongs_to :citation

  validates :user_id, :presence => true
end
