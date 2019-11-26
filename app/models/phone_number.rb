class PhoneNumber < ApplicationRecord
	extend PhoneNumbersHelper
	
	# Validations
	validates :number, presence: true, uniqueness: true

	def self.allocate_number
		create(number: generate_random_number)
	end
end
