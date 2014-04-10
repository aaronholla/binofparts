class AboutController < ApplicationController
	around_filter :append_event_tracking_tags
end
