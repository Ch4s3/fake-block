class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :blocks
  
  ROLES = %w[admin moderator user]
  
  def role_symbols
    [role.to_sym]
  end

  def has_role?(role)
    roles.include? role.to_s
  end
end
