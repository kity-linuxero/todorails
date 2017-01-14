class SimpleTask < Task

	validates :status, presence: true, inclusion: { in: %w(pending done),
    message: "%{value} is not a valid status." }

		def self.model_name
    	Task.model_name
  	end
end
