class TemporaryTask < Task

    validates :start_at, presence: true
    validates :end_at, presence: true
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

end
