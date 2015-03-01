class User < ActiveRecord::Base
  authenticates_with_sorcery!
  
  attr_accessible :email, :password, :password_confirmation, :authentications_attributes
  authenticates_with_sorcery! do |config|
    config.authentications_class = Authentication
  end

  has_many :authentications, :dependent => :destroy
  accepts_nested_attributes_for :authentications

  belongs_to :cohort
  has_many :memberships
  has_many :groups, through: :memberships
  has_many :requests, as: :requestable
end
