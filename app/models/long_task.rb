class LongTask < Task
    validates :percentage_of_completion, presence: true, inclusion: { in: (0..100),
    message: "%{value} is not a valid percentage number for a LongTask" }

		def self.model_name
			Task.model_name
		end

		def status_task
			if (1..99) === percentage_of_completion
				"in progress"
			else
				orig_stat
			end
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
