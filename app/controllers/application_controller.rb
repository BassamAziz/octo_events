class ApplicationController < ActionController::API
	rescue_from ActiveRecord::RecordNotFound, with: :not_found

	def not_found(exception)
    	render status: :not_found, json: { error: exception.message }
  	end
end
