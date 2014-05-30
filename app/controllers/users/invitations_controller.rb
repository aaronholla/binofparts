class Users::InvitationsController < Devise::InvitationsController
	def create
		super
		track_event("Invitation Sent", email: params[:user][:email], team_number: params[:user][:team_number_id], admin: params[:user][:admin])
	end

	def update
		super
		track_event("Accepted Invitation")
	end
end
