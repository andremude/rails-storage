require 'rails_helper'

RSpec.describe Storage, type: :model do
  current_user = User.first_or_create!(id: 1, email: "manuelr@example.com", first_name: "Manuel", last_name: "Robinson", document_number: "70025447", password: "123456")
  subject { Storage.new(id: 1, title: "Lorem Ipsum", description: "Lorem Ipsum", meters: '45', address: "Rue du Béguinage 28, Brussels", city: "Brussels", country: "Belgium", price: 50.00, storage_type: "Car Parking", features: ["Pet Free", "Security Camera", "Smoke Detector", "Climate Controlled"], user: current_user)}
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end
    it "is not valid without a price" do
      subject.price=nil
      expect(subject).to_not be_valid
    end
    it "is not valid without a title" do
      subject.title=nil
      expect(subject).to_not be_valid
    end
    it "is not valid without an address" do
      subject.address=nil
      expect(subject).to_not be_valid
    end
    it "is not valid without a description" do
      subject.description=nil
      expect(subject).to_not be_valid
    end
    it "is not valid without meters" do
      subject.meters=nil
      expect(subject).to_not be_valid
    end
    it "is not valid without a city" do
      subject.city=nil
      expect(subject).to_not be_valid
    end
    it "is not valid without a country" do
      subject.country=nil
      expect(subject).to_not be_valid
    end
    it "is not valid without a storage type" do
      subject.storage_type=nil
      expect(subject).to_not be_valid
    end
end
