require 'rails_helper'

RSpec.describe AboutController, :type => :controller do
	describe "GET #index" do
	    it "returns a 200 status" do
	      get :index
	      expect(response).to be_success
	      expect(response.status).to eq(200)
	    end

	    it "renders the index template" do
	      get :index
	      expect(response).to render_template("index")
	    end
	end
end
