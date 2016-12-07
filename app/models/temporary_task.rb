class TemporaryTask < Task

    validates :start_at, presence: true
    validates :end_at, presence: true
		validate :end_date_is_after_start_date

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

	def start_at_task
		start_at.getlocal.strftime("%d/%m/%Y - %H:%M")
	end

	def end_at_task
		end_at.getlocal.strftime("%d/%m/%Y - %H:%M")
	end

	def percentage_of_completion_task
		nil
	end

	private
		def end_date_is_after_start_date
		  if end_at < start_at
		    errors.add(:end_at, "cannot be before the start date")
		  end
	end

end
