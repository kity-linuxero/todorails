class SimpleTask < Task

	validates :status, presence: true, inclusion: { in: %w(pending done),
    message: "%{value} is not a valid status." }

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
			nil
		end

		def type_taks
			"Simple"
		end
end
