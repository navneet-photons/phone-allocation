class PhoneNumber < ApplicationRecord
	extend PhoneNumbersHelper
	
	# Validations
	validates :number, presence: true, uniqueness: true
	validate :range_check

	private

	def range_check
		in_range = (1111111111..9999999999).include?(self.number)
	  unless in_range
	    errors.add(:phone_number, "Phone number out of range")
	  end
  end
	
	def self.allocate_number
		create(number: generate_random_number)
	end
end
