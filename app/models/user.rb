class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  include User::OmniAuthExtension

  attr_accessible :full_name, :email, :password, :phone, :password_confirmation, :first_name, :last_name, :position, :affiliation, :website, :twitter, :street1, :street2, :city, :state, :postal_code, :agency_id
  validates :first_name, :presence => true

  has_many :organizations
  has_many :data_sets
  has_many :suggested_data_sets, :class_name => "DataSet"
  has_many :comments
  has_many :sunshine_requests
  
  
  def full_name_with_email
    "#{self[:full_name]} (#{email})"
  end
  
  def full_name
    "#{self[:first_name]} #{self[:last_name]}"
  end

  def admin?
    self.is_admin ? true :  false
  end  
  
  def update_with_password(params={}) 
    if params[:password].blank? 
      params.delete(:password) 
      params.delete(:password_confirmation) if 
      params[:password_confirmation].blank? 
    end 
    update_attributes(params) 
  end
  
end

