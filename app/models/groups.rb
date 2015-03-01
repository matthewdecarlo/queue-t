class Groups < ActiveRecord::Base
  belongs_to :memberships
  has_many :requests, as: :requestable
end
