class Task < ApplicationRecord
  belongs_to :task_list#, inverse_of: :tasks
  validates :description, presence: true, length: { maximum: 255 }
  validates :priority, presence: true, inclusion: { in: %w(low medium high),
  message: "%{value} is not a valid priority" }

  validates :type, presence: true, inclusion: { in: %w(SimpleTask LongTask TemporaryTask),
  message: "%{value} is not a valid task" }

  PRIORITIES = {
    'high' => 3,
    'medium'  => 2,
    'low'  => 1,
  }

  def <=> (other)
    PRIORITIES[other.priority] <=> PRIORITIES[self.priority]
  end

end
