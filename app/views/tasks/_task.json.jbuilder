json.extract! task, :id, :task_list_id, :description, :status, :priority, :percentage_of_completion, :type, :start_at, :end_at, :created_at, :updated_at
json.url task_url(task, format: :json)