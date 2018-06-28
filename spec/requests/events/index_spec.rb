require 'rails_helper'
require 'support/factory_girl'

describe "GET /issues/:issue_id/events" do

	context 'when the issue exists' do
		it 'retrieves the events of an issue' do

			issue = create(:issue)

				10.times do
					create(:event, issue: issue)
				end

			get "/issues/#{issue.number}/events"

			# test for the 200 status-code
			expect(response).to be_success

			# check the isse has the right events
			body = JSON.parse(response.body)
			expect(body.size).to eq(10)
		end
	end

	context 'when the issue does not exist' do
	    it 'returns HTTP 404' do
	    	issue = create(:issue)

		    get "/issues/#{issue.number+1000}/events"
	      	expect(response.status).to eq 404
	    end
  end
end



