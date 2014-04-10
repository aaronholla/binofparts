class KopController < ApplicationController
	around_filter :append_event_tracking_tags
	before_action :set_year, only: [:show]

	def show
		@half = (@parts.count / 2.to_f).ceil
	end

	private
	def set_year
      @parts = Part.where(:year => params[:id])
    end
end
