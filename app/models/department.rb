class Department < ApplicationRecord
  belongs_to :division
  has_many :employees

  def to_s
    name
  end
end
