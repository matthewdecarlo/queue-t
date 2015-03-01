class Cohorts < ActiveRecord::Base
  has_many :students
  has_many :instructors
end
