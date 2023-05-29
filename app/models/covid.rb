class Covid < ApplicationRecord
	enum status: [:waiting, :pending, :negative, :positive]
	belongs_to :user
	# enum status: { active: 0, archived: 1 }
	validates :test_date, presence: true
end
