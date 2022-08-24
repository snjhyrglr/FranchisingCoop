class Cooperative < ApplicationRecord
  belongs_to :region, optional: true
  belongs_to :province, optional: true
  belongs_to :municipality, optional: true
  belongs_to :barangay, optional: true
end
