class CooperativeFranchise < ApplicationRecord
  belongs_to :cooperative
  belongs_to :franchisee, polymorphic: true, optional: true
  belongs_to :product
  belongs_to :creator, polymorphic: true, optional: true

  STATUS = ["Initiated", "Quoted", "Sold", "Expired"]

  before_save :compute_expiry

  def compute_expiry
    self.expiry = Date.today + 6.months
  end
end
