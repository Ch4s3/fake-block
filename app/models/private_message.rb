class PrivateMessage < ActiveRecord::Base
  belongs_to :sender, foreign_key: 'sender_id', class_name:'User'
  belongs_to :receiver, foreign_key: 'receiver_id', class_name:'User'

  #validates :receiver, :presence => {:message => 'The message must have a recipient'}
  #validates :body, :presence => {:message => 'The message body cannot be blank'}
  validates_presence_of :body
  validates_presence_of :receiver_id

  end
