class Comment < ActiveRecord::Base
  belongs_to :block
  belongs_to :user
  validates :body, :presence => {:message => 'The comment cannot be blank'}
end
