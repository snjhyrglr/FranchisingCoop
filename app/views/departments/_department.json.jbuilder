json.extract! department, :id, :division_id, :name, :short_name, :active, :created_at, :updated_at
json.url department_url(department, format: :json)
