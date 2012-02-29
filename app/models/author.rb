class Author < ActiveRecord::Base
  has_many :authorships
  has_many :citations, :through => :authorships
end
