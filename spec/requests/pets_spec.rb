require 'rails_helper'

RSpec.describe 'Pets API', type: :request do
  let(:pet) { FactoryBot.create(:pet) }
  let(:auth_headers) {{ 'Authorization' => "Bearer token" } }

  describe 'GET /pets' do
    it "returns all pets" do
      FactoryBot.create_list(:pet, 3)
      get '/pets', headers: auth_headers
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body).size).to eq(3)
    end
  end

  describe 'POST /pets' do
    it 'creates a pet' do
      pet_params = { name: 'Max', breed: 'Beagle', age: 3, vaccinated: true }
      post '/pets', params: { pet: pet_params }, headers: auth_headers
      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)['name']).to eq('Max')
    end
  end

  describe 'GET /pets/:id' do
    it 'shows a pet' do
      get "/pets/#{pet.id}", headers: auth_headers
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)['id']).to eq(pet.id)
    end
  end

  describe 'PUT /pets/:id/expire_vaccination' do
    it "updates pet vaccinated false" do
      put "/pets/#{pet.id}/expire_vaccination", headers: auth_headers
      expect(response).to have_http_status(:ok)
      expect(pet.reload.vaccinated).to be_falsy
    end
  end

end
