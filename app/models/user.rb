class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  include User::OmniAuthExtension

  attr_accessible :full_name, :email, :password, :password_confirmation
  validates :full_name, :presence => true

  has_many :organizations
  has_many :data_sets
  has_many :suggested_data_sets, :class_name => "DataSet"
  has_many :comments
  
  def full_name_with_email
    "#{self[:full_name]} (#{email})"
  end
  
  def admin?
    self.is_admin ? true :  false
  end  
end
