json.extract! employee, :id, :last_name, :first_name, :middle_name, :employee_no, :division_id, :department_id, :position, :user_name, :created_at, :updated_at
json.url employee_url(employee, format: :json)
