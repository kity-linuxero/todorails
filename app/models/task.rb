class Task < ApplicationRecord
  belongs_to :task_list#, inverse_of: :tasks
  validates :description, presence: true, length: { maximum: 255 }
  validates :priority, presence: true, inclusion: { in: %w(low medium high),
  message: "%{value} is not a valid prioriry" }

end
