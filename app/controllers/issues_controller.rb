class IssuesController < ApplicationController
	def stats
		@stats = Issue.group(:state).count
		render json: @stats, status: 200
	end
end
