json.extract! task, :id, :customer_id, :title, :body, :status, :created_at, :updated_at
json.url task_url(task, format: :json)
