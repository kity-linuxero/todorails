class LongTask < Task
    validates :percentage_of_completion, presence: true, inclusion: { in: (0..100),
    message: "%{value} is not a valid percentage number for a LongTask" }

		def self.model_name
			Task.model_name
		end

		def status_task
      case percentage_of_completion
        when (1..99)
          "in progress"
        when 0
          "pending"
        when 100
          "done"
       end    
		end

		def start_at_task
			nil
		end

		def end_at_task
			nil
		end

		def percentage_of_completion_task
			"#{percentage_of_completion}%"
		end

		def type_taks
			"Long"
		end
end
