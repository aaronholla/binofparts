class Users::SessionsController < Devise::SessionsController
	def new
	    super
	  	track_event "Loaded Login"
	end
	def create
	    super
	  	track_event "Logged In"
	  	mixpanel_people_set("$email" => current_user.email, "$first_name" => current_user.first_name, "$last_name" => current_user.last_name, "team_number" => current_user.team_number_id, "admin" => current_user.admin)
	end
	def destroy
	    super
	  	track_event "Logged Out"
	end
end
