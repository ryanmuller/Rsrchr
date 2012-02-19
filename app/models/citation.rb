class Citation < ActiveRecord::Base
  has_many :scrobbles
  has_many :pdfhashes
end
