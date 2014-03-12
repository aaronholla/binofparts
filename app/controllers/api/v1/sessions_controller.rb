class API::V1::SessionsController < API::V1::BaseController
  skip_before_filter :verify_authenticity_token
 	respond_to :json
	def create
		email = params[:email]
		password = params[:password]
		if request.format != :json
			render :status=>406, :json=>{:message=>"The request must be json."}
			return
		end

		if email.nil? or password.nil?
		   render :status=>400,
		          :json=>{:message=>"The request must contain the user email and password."}
		   return
		end

		@user=User.find_by_email(email.downcase)

		if @user.nil?
		  logger.info("User #{email} failed signin, user cannot be found.")
		  render :status=>401, :json=>{:message=>"Invalid email or passoword."}
		  return
		end

		ensure_authentication_token

		if not @user.valid_password?(password)
		  logger.info("User #{email} failed signin, password \"#{password}\" is invalid")
		  render :status=>401, :json=>{:message=>"Invalid email or password."}
		else
		  render :status=>200, :json=>{:token=>@user.authentication_token, :team=>@user.team_number_id}
		end
	end
 
	def destroy
		@user=User.find_by_authentication_token(params[:id])
	    if @user.nil?
	      logger.info("Token not found.")
	      render :status=>404, :json=>{:message=>"Invalid token."}
	    else
	      reset_authentication_token
	      render :status=>200, :json=>{:token=>params[:id]}
	    end
	end

	def ensure_authentication_token
		if @user.authentication_token.blank?
	      self.authentication_token = generate_authentication_token
	    end
	end
 
  private
  
  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless User.where(authentication_token: token).first
    end
  end

  def reset_authentication_token
  	@user.authentication_token = nil
  	@user.save
  end

end