class Membership < ActiveRecord::Base
  belongs_to :member, class_name: "User"
  belongs_to :team
end
