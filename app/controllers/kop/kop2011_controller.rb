class Kop::Kop2011Controller < ApplicationController
	def index
		@first_half, @second_half = Kop2011.all.in_groups_of(Kop2011.count / 2)
	end
end
