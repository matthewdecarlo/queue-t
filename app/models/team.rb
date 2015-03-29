class Team < ActiveRecord::Base
  has_many :memberships
  has_many :members, through: :memberships
  has_many :requests, as: :requestable

  def begin_from
    self.begin_date.strftime("%F")
  end

  def end_to
    self.end_date.strftime("%F")
  end
end
