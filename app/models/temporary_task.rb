class TemporaryTask < Task
	validates :status, presence: true, inclusion: { in: %w(pending done expired),
    message: "%{value} is not a valid status for a temporary task" }

    validates :start_at, presence: true
    validates :end_at, presence: true


end
