class Cohort < ActiveRecord::Base
  has_many :students, class_name: "User" #, -> { where type: "student" }
  has_many :instructors, class_name: "User" #, -> { where type: "instructor" }
end
