class Goal < ApplicationRecord
  validates :title, :user_id, presence: true
  validates :completed?, :private?, inclusion: { in: [true, false] }

  belongs_to :user

end
