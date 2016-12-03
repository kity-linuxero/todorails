class TaskList < ApplicationRecord
  has_many :tasks, dependent: :destroy
  validates :name, presence: true

  extend FriendlyId
  friendly_id :name, use: :slugged

end
