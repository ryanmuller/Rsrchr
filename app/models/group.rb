class Group < ActiveRecord::Base
  has_many :memberships
  has_many :users, :through => :memberships do
    def push_with_attributes(user, join_attrs)
      Membership.with_scope(:create => join_attrs) { self << user }
    end
  end
  has_many :postings
  has_many :citations, :through => :postings
end
