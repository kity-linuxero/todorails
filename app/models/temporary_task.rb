class TemporaryTask < Task

    validates :start_at, presence: true
    validates :end_at, presence: true
		validate :end_date_is_after_start_date

    validates :status, presence: true, inclusion: { in: %w(pending done expired),
      message: "%{value} is not a valid status." }

		def self.model_name
			Task.model_name
		end

		def status
			if end_at < Time.now
			"expired"
		else
			super
		end
	end

	private
		def end_date_is_after_start_date
		  if end_at < start_at
		    errors.add(:end_at, " cannot be before the start date")
		  end
	end

end
