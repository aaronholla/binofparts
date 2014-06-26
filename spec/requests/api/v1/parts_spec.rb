require 'rails_helper'

describe "Parts API", :type => :request do

  part = FactoryGirl.create(:part)
  category_part = FactoryGirl.create(:part, :category => "Motors")

  describe "#show" do
    context 'when resource is found' do
      before {
        get "/api/v1/parts/#{part.id}"
      }

      it 'responds with 200' do
        expect(response.status).to eq(200)
      end

      it 'has a name in response body' do
        json = JSON.parse(response.body)
        expect(json['name']).to eq(part.name)
      end
    end

    context 'when resource is not found' do
      before {
        get "/api/v1/parts/0"
      }

      it 'responds with 404' do
        expect(response.status).to eq(404)
      end

      it 'has error message' do
        json = JSON.parse(response.body)
        expect(json['error']).not_to be_nil
      end

      it 'has no part error' do
        json = JSON.parse(response.body)
        expect(json['error']).to include("Part")
      end
    end
  end

  describe '#category' do
    context 'when parts are found for category' do
      before {
        get "/api/v1/parts/category/#{category_part.category}"
      }

      it 'responds with 200' do
        expect(response.status).to eq(200)
      end

      it 'has one part in response' do
        json = JSON.parse(response.body)
        expect(json['parts'].length).to eq(1)
      end
    end

    context 'when parts are not found for category' do
      before {
        get "/api/v1/parts/category/fake_category"
      }

      it 'responds with 404' do
        expect(response.status).to eq(404)
      end

      it 'has error message' do
        json = JSON.parse(response.body)
        expect(json['error']).not_to be_nil
      end

      it 'has no category error' do
        json = JSON.parse(response.body)
        expect(json['error']).to include("Category")
      end
    end
  end

end
