class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :division
  belongs_to :department

  before_save :create_username

  def name
    "#{last_name}, #{first_name} #{middle_name[0]}."
  end

  def create_username
    # self.username = "#{first_name}[0]#{middle_name[0]}#{last_name}"
    self.user_name = (first_name[0] + middle_name[0] + last_name).downcase.gsub(/\s+/, "")
    self.password = self.user_name
    self.email = "#{self.user_name}@1cisp.coop"
  end
end
