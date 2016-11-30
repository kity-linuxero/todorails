class LongTask < Task
	validates :status, presence: true, inclusion: { in: %w(pending done in_progress),
    message: "%{value} is not a valid status for a long task" }

    validates :percentage_of_completion, presence: true, inclusion: { in: (0..100),
    message: "%{value} is not a valid percentage number" }
end
