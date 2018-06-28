require 'rails_helper'
require 'support/factory_girl'

describe "POST /events" do

	context 'when the issue exists' do

		it 'creates an event and updates an issue' do
			issue = create(:issue)

			post "/events", :params => { "event": {"action": "edited"},  "issue": { "number": issue.number,  "state": "open"} }
			
			expect(response).to have_http_status(:created)

		end

	end

	context 'when the issue does not exist' do
	    it 'creates an event and creates an issue' do

			post "/events", :params => { "event": {"action": "edited"},  "issue": { "number": 8000,  "state": "open"} }
			
			# test for the 200 status-code			
			expect(response).to have_http_status(:created)

		end
	end
end



