class Kop::Kop2010Controller < ApplicationController
	def index
		@first_half, @second_half = Kop2010.all.in_groups_of(Kop2010.count / 2)
	end
end
