class KopController < ApplicationController
	before_action :set_year, only: [:show]
	def show
		@first_half, @second_half = @parts.in_groups_of(@parts.count / 2)
	end

	private
	def set_year
      @parts = Part.where(:year => params[:id])
    end
end
