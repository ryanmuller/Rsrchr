class UserCitation < ActiveRecord::Base
  belongs_to :user
  belongs_to :citation
end
