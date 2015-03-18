require 'rails_helper'

describe "Parts API", :type => :request do
  include ApiHelpers
  let( :part ) { FactoryGirl.create(:part) }
  let( :category_part ) { FactoryGirl.create(:part, :category => "Motors") }

  describe "GET /parts/:part_id" do
    it 'returns a part by id' do
      get "/api/v1/parts/#{part.id}"
      expect(response.status).to eq(200)
      expect(json_response['name']).to eq(part.name)
    end

    it 'returns 404 if part id not found' do
      get "/api/v1/parts/0"
      expect(response.status).to eq(404)
    end
  end

  describe 'GET /parts/category' do
    it 'returns all parts in category' do
      get "/api/v1/parts/category/#{category_part.category}"
      expect(response.status).to eq(200)
      expect(json_response).to be_an Array
      expect(json_response.first['id']).to eq(category_part.id)
      expect(json_response.length).to eq(1)
    end

    it 'responds with 404 if category not found' do
      get "/api/v1/parts/category/fake_category"
      expect(response.status).to eq(404)
    end
  end

end
