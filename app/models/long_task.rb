class LongTask < Task
	validates :status, presence: true, inclusion: { in: %w(pending done in_progress),
    message: "%{value} is not a valid status for a long task for a LongTask" }

    validates :percentage_of_completion, presence: true, inclusion: { in: (0..100),
    message: "%{value} is not a valid percentage number for a LongTask" }

		def self.model_name
			Task.model_name
		end

		def status_task
			status
		end

		def start_at_task
			nil
		end

		def end_at_task
			nil
		end

		def percentage_of_completion_task
			percentage_of_completion
		end
end
