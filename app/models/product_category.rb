class ProductCategory < ApplicationRecord
  belongs_to :product_line

  def to_s
    name
  end
end
