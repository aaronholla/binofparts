class Kop::Kop2013Controller < ApplicationController
	def index
		@first_half, @second_half = Kop2013.all.in_groups_of(Kop2013.count / 2)
	end
end
