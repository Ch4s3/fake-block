class Block < ActiveRecord::Base
  acts_as_votable
	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validate :any_present?
  belongs_to :user
  has_many :comments

  def self.text_search(query)
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
