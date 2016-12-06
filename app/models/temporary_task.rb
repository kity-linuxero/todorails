class TemporaryTask < Task
	validates :status, presence: true, inclusion: { in: %w(pending done expired),
    message: "%{value} is not a valid status for a temporary task" }

    validates :start_at, presence: true
    validates :end_at, presence: true

		def self.model_name
			Task.model_name
		end

		def status_task
			if end_at < Time.now
			"expired"
		else
			status
		end
	end
end
