require 'rails_helper'

RSpec.describe AboutController, :type => :controller do
	describe "GET #index" do
	    it "should respond successfully with an HTTP 200 status code" do
	      get :index
	      expect(response).to be_success
	      expect(response.status).to eq(200)
	    end

	    it "should render the index template" do
	      get :index
	      expect(response).to render_template("index")
	    end
	end
end
