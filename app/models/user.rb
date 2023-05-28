class User < ApplicationRecord
	has_secure_password
	validates :citizen_id, presence: true
end
