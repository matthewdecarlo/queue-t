class Request < ActiveRecord::Base
  belongs_to :requestable, polymorphic: true
end
