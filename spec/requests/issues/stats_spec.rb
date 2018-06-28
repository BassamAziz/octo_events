require 'rails_helper'
require 'support/factory_girl'

describe "GET /issues/stats" do

	
	it 'retrieves the count of open and closed issues' do
		get "/issues/stats"

		# test for the 200 status-code
		expect(response).to be_success		
	end
	
end



