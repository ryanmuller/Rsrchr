class Tag < ActiveRecord::Base
  has_many :taggings
  has_many :citations, :through => :taggings

  validates :name, :presence => true
  validates :name, :uniqueness => true
end
