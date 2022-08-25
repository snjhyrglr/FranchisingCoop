class Agent < ApplicationRecord
  belongs_to :region

  before_save :create_username 

  def create_username
    self.user_name = (first_name[0] + middle_name[0] + last_name).downcase.gsub(/\s+/, "")
  end
end
