class Division < ApplicationRecord
  has_many :departments
  has_many :employees

  def to_s
    name
  end
end
