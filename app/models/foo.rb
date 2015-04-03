class Foo < ActiveRecord::Base
  belongs_to :user
  has_many :bars
  acts_as_votable 
end
