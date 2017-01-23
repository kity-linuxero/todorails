class Task < ApplicationRecord
  belongs_to :task_list
  validates :description, presence: true, length: { maximum: 255 }
  validates :priority, presence: true, inclusion: { in: %w(low medium high),
  message: "%{value} is not a valid priority" }

  validates :type, presence: true, inclusion: { in: %w(SimpleTask LongTask TemporaryTask),
  message: "%{value} is not a valid task" }

  validates_associated :task_list

  validate :end_date_is_after_start_date, if: :conditions

  PRIORITIES = {
    'high' => 3,
    'medium'  => 2,
    'low'  => 1,
  }

  def <=> (other)
    PRIORITIES[other.priority] <=> PRIORITIES[self.priority]
  end

  private
    def end_date_is_after_start_date
      if end_at < start_at
        errors.add(:end_at, " cannot be before the start date")
      end
  end

  def conditions
    type=='TemporaryTask'
  end
end
