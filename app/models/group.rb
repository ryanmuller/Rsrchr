class Group < ActiveRecord::Base
  has_many :memberships
  has_many :users, :through => :memberships
  has_many :postings
  has_many :citations, :through => :postings
end
