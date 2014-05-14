class Comment < ActiveRecord::Base
  acts_as_votable
  belongs_to :block
  belongs_to :user
  validates :body, :presence => {:message => 'The comment cannot be blank'}
end
