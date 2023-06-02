class User < ApplicationRecord

	#validations
	has_secure_password
	validates :citizen_id, :fullname, :gender, :date_of_birth, :contact_number, :address, presence: true
	validates :citizen_id, format: { with: /\d{13}/, message: "Citizen ID should be arabic number"} 
	validates :citizen_id, length: { is: 13  }
	validates :fullname, format: { with: /\A[\u0E00-\u0E7Fa-zA-Z]+\s[\u0E00-\u0E7Fa-zA-Z]+\z/ }
	validates :gender, format: { with: /(Male|Female|Others)/}
	validates :date_of_birth, format: { with: /\A\d{4}\-(0[1-9]|1[012])\-(0[1-9]|[12][0-9]|3[01])\z/}
	validates :contact_number, format: { with: /\A\d{9,10}\z/ }
	validates :password, length: { minimum: 8}	
	#validate with custom method
	validate :date_of_birth_validation


	#associations
	has_many :covids

	def date_of_birth_validation
		now = Time.now.strftime("%Y-%m-%d")
		# puts  "today: " + now
		# puts  "day-of-birth: " + date_of_birth.to_s
		if date_of_birth.present? && date_of_birth.to_s > now
			errors.add(:date_of_birth, "invalid, Date must be less than today.")
		end
	end
end
