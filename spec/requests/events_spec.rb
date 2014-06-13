require 'rails_helper'

RSpec.describe "Events", :type => :request do
  describe "GET /events" do
    it "displays events" do
      FactoryGirl.create(:event, :name => "orlando regional", :key => "2014flor")
      get events_path
      expect(response.body).to include("orlando regional")
    end
  end
end
