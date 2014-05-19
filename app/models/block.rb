class Block < ActiveRecord::Base
  scope :not_expired, lambda{ |time = Time.now| where("? BETWEEN created_at AND expiration OR expiration = ?", time, nil) }

  acts_as_votable
	has_attached_file :image, 
                    :styles => { :medium => "300x300>", 
                    :thumb => "100x100>" }, 
                    :default_url => "/images/:style/missing.png",
                    :storage => :s3,
                    :bucket => 'paperclip-bucket-fake_block',
                    :s3_credentials => S3_CREDENTIALS,
                      :url => "/:image/:id/:style/:basename.:extension",
                      :path => ":image/:id/:style/:basename.:extension"
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validate :any_present?
  belongs_to :user
  has_many :comments

  def expired?
    if self.expiration.present?
      if self.expiration <= Time.now
        return true
      else
        return false
      end

    else
      return false
    end
  end

  def self.delete_expired
    Block.find_each do |b|
      if b.expired?
        b.destroy
      end
    end
  end

  def expires_in seconds
    unless seconds == -1
      date_time = Time.now + (seconds).seconds
      self.expiration = date_time
    else
      self.expiration = nil
    end
  end

  def self.text_search query
    if query.present?
      where("body @@ :q or body ~* :q", q: query)
    else
      scoped
    end
  end

  def any_present?
    if %w(body image_file_name).all?{|attr| self[attr].blank?}
      errors.add :base, "Add text or an image to the block"
    end
  end
end
