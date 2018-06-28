class Issue < ApplicationRecord
	has_many :events

	enum state: [:open, :closed]
end
