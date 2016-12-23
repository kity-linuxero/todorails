class TaskList < ApplicationRecord
  has_many :tasks, dependent: :destroy
  validates :name, presence: true
  validates :slug, uniqueness: true
  
  extend FriendlyId
  friendly_id :name, use: :slugged

  # For not generate a new slug when name change
  # No generará un nuevo slug cuando el nombre cambie
  def should_generate_new_friendly_id?
     new_record?
   end
end
