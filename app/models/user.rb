class User < ActiveRecord::Base
  authenticates_with_sorcery!
  
  # attr_accessible :email, :password, :password_confirmation, :authentications_attributes
  authenticates_with_sorcery! do |config|
    config.authentications_class = Authentication
  end

  has_many :authentications, :dependent => :destroy
  accepts_nested_attributes_for :authentications


  belongs_to :cohort
  has_many :memberships, foreign_key: :member_id
  has_many :teams, through: :memberships
  has_many :requests, as: :requestable


  validates :password, length: { minimum: 3 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true

  validates :email, uniqueness: true

  def name
    "#{first_name} #{last_name}"
  end

  def self.student
    where(role: 'student')
  end

  def self.teacher
    where(role: 'teacher')
  end

end
