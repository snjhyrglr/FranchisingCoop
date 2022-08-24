class Municipality < ApplicationRecord
  belongs_to :region
  belongs_to :province
end
