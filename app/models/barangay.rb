class Barangay < ApplicationRecord
  belongs_to :region
  belongs_to :province
  belongs_to :municipality
end
