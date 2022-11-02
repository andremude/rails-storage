require 'rails_helper'

RSpec.describe '/storages', type: :request do
  current_user = User.first_or_create!(id: 2, email: "manuelf@example.com", first_name: "Manuel", last_name: "Ford", document_number: "70025447", password: "123456")

  let(:valid_attributes) do
    {
      'id' => '1',
      'title' => 'Lorem Ipsum',
      'description' => 'Lorem Ipsum',
      'meters' => '45',
      'address' => 'Rue du Béguinage 28, Brussels',
      'city'=> 'Brussels',
      'country' => 'Belgium',
      'price' => '50.00',
      'storage_type' => 'Car Parking',
      'features' => ["Pet Free", "Security Camera", "Smoke Detector", "Climate Controlled"],
      'user' => current_user
    }
  end

  let(:invalid_attributes) do
    {
      'id' => '1',
      'title' => '',
      'description' => '',
      'meters' => '45',
      'address' => 'Rue du Béguinage 28, Brussels',
      'city'=> 'Brussels',
      'country' => 'Belgium'
    }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      storage = Storage.new(valid_attributes)
      storage.user = current_user
      storage.save
      get storages_path
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      storage = Storage.new(valid_attributes)
      storage.user = current_user
      storage.save
      get storage_path(storage)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Storage' do
        expect do
          storage = Storage.new(valid_attributes)
          storage.user = current_user
          storage.save
          post storages_path, params: { storage: valid_attributes }
        end.to change(Storage, :count).by(1)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Storage' do
        expect do
          post storages_path, params: { storage: invalid_attributes }
        end.to change(Storage, :count).by(0)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        {
          'title' => 'Lorem Ipsum 2',
        }
      end

      it 'updates the requested storage' do
        storage = Storage.new(valid_attributes)
        storage.user = current_user
        storage.save
        expect do
          patch storage_path(storage), params: { storage: new_attributes }
          storage.reload
        end
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested storage' do
      storage = Storage.new(valid_attributes)
      storage.user = current_user
      storage.save
      expect do
        delete storage_path(storage)
        expect(response).to change(Storage, :count).by(-1)
      end
    end
  end
end
