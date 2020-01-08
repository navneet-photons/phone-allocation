class Allocation < ApplicationRecord
	extend AllocationsHelper
	
	# Validations
	validates :number, presence: true, uniqueness: true
	validate :check_number_range

	private

	def check_number_range
		in_range = (1111111111..9999999999).include?(self.number)
	  unless in_range
	    errors.add(:allocation, "Given Phone Number is out of range")
	  end
  end
	
	def self.allocate_number
		create(number: generate_random_number)
	end
end
