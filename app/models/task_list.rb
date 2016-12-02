class TaskList < ApplicationRecord
  has_many :tasks, dependent: :destroy
  validates :name, presence: true
  # validates :url, presence: true, uniqueness: true

  extend FriendlyId
  friendly_id :name, use: :slugged

end
