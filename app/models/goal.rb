class Goal < ApplicationRecord
  validates :title, :user_id, presence: true
  validates :completed?, :private?, inclusion: { in: [true, false] }
  validates :title, uniqueness: { scope: :user_id }
  belongs_to :user



end
