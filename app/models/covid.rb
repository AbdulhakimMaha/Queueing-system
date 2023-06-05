class Covid < ApplicationRecord
	enum status: [:waiting, :pending, :negative, :positive]
	belongs_to :user
	# enum status: { active: 0, archived: 1 }

	#validates with built-in methods
	validates :test_date, presence: true

	# validate with custom method
	validate :test_date_validate

	def test_date_validate
		now = Time.now.strftime("%Y-%m-%d")
		if test_date.present? && test_date.to_s < now
			errors.add(:test_date, "invalid, Date must be greather than today")
		end
	end
end
