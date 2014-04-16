class Comment < ActiveRecord::Base
  belongs_to :block
  belongs_to :user
end
