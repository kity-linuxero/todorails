class Task < ApplicationRecord
  belongs_to :task_list#, inverse_of: :tasks
  validates :description, presence: true, length: { maximum: 255 }
  validates :priority, presence: true, inclusion: { in: %w(low medium high),
  message: "%{value} is not a valid prioriry" }

def initialize
 alias_method :save_orig, :save
end

  def save
    @url = "ljdfsjsfdljkaflskjf"
    self.send"save_orig"
  end
end
