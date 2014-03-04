class HomeController < ApplicationController
	def index
		@requests = Event.find_by_key('2014txsa').requests
		
	end
end
