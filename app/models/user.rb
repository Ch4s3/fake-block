class User < ActiveRecord::Base
  has_attached_file :avatar, 
                    :styles => { :medium => "400x400>", :thumb => "200x200>" }, 
                    :default_url => "/images/:style/missing.png",
                    :storage => :s3,
                    :bucket => 'paperclip-bucket-fake_block',
                    :s3_credentials => S3_CREDENTIALS
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :friends, :through => :friendships, :conditions => "status = 'accepted'"
  has_many :requested_friends, :through => :friendships, :source => :friend, :conditions => "status = 'requested'", :order => :created_at
  has_many :pending_friends, :through => :friendships, :source => :friend, :conditions => "status = 'pending'", :order => :created_at
  has_many :friendships, :dependent => :destroy
  has_many :private_messages
  has_many :blocks
  has_many :comments

  def self.text_search(query)
    if query.present?
      where("name @@ :q or name ~* :q", q: query)
    else
      scoped
    end
  end
end
