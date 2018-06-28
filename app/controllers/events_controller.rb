class EventsController < ApplicationController
	before_action :get_or_create_issue, only: [:create]
	before_action :get_issue, only: [:index]
	after_action  :update_issue, only: [:create]

	def index
		@events = @issue.events
		render json: @events, status: 200
	end
	
	def create
		@event = @issue.events.build(event_params[:event])
		if @event.save
			head :created
		else
			render json: { errors: JsonErrorFormatter.new(@event).response }, status: 422
		end
	end

	private

		def get_or_create_issue
			@issue = Issue.find_by(number: issue_params[:issue][:number])
			@issue = Issue.create(issue_params[:issue]) if @issue.nil?
		end

		def get_issue
			@issue = Issue.find_by!(number: params[:issue_id])
		end

		def update_issue
			@issue.update_attributes(state: issue_params[:issue][:state])
		end

		def event_params
		    params.permit(event: [:action])
		end

		def issue_params
			params.permit(issue: [:number, :state])
		end

end

