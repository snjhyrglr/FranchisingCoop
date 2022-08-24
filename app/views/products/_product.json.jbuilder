json.extract! product, :id, :product_line_id, :product_category_id, :name, :code, :active, :created_at, :updated_at
json.url product_url(product, format: :json)
