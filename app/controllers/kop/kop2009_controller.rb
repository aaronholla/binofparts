class Kop::Kop2009Controller < ApplicationController
	def index
		@first_half, @second_half = Kop2009.all.in_groups_of(Kop2009.count / 2)
	end
end
