class PhoneNumbersController < ApplicationController
	def index
		numbers = PhoneNumber.all
		if numbers.present? 
			render json: {numbers: numbers, status: :success, message: "List of all the numbers"}
		else
			render json: {status: :failure, message: "Failed to find numbers"}
		end
	end

	def create
		if number = PhoneNumber.allocate_number
			render json: {number: number, status: :success, message: "Number allocated successfully"}
		else
			render json: {status: :failure, message: "Failed to allocate number"}
		end
	end

	def allocate_custom_number
		number = PhoneNumber.find_by(number: params[:id])
		unless number.present?
			number = PhoneNumber.create(number: params[:id])
		else
			number = PhoneNumber.allocate_number
		end
		render json: {number: number, status: :success, message: "Number allocated successfully"}
	end
end
