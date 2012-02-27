class Tag < ActiveRecord::Base
  has_many :taggings
  has_many :citations, :through => :taggings
end
