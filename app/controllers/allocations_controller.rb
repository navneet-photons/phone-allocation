class AllocationsController < ApplicationController
	def index
		numbers = Allocation.all
		if numbers.present? 
			render json: {numbers: numbers, status: :success, message: "List of all the numbers"}
		else
			render json: {status: :failure, message: "Failed to find numbers"}
		end
	end

	def create
		if number = Allocation.allocate_number
			render json: {number: number, status: :success, message: "Number allocated successfully"}
		else
			render json: {status: :failure, message: "Failed to allocate number"}
		end
	end

	def allocate_custom_number
		number = Allocation.find_by(number: params[:id])
		unless number.present?
			number = Allocation.create(number: params[:id])
			if number.errors.present?
				render json: {status: :failure, message: "Number not in range"}	and return
			end
		else
			number = Allocation.allocate_number
		end
		render json: {number: number, status: :success, message: "Number allocated successfully"}
	end
end
