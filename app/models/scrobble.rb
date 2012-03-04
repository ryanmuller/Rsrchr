class Scrobble < ActiveRecord::Base
  belongs_to :user
  belongs_to :citation

  validates :user_id, :presence => true

  default_scope :order => 'created_at DESC'
end
