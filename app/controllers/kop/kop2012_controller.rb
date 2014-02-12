class Kop::Kop2012Controller < ApplicationController
	def index
		@first_half, @second_half = Kop2012.all.in_groups_of(Kop2012.count / 2)
	end
end
