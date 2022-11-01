require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(id: 1, email: "johng@example.com", first_name: "John", last_name: "Gilbert", document_number: "70025447", password: "123456")}
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end
    it "is not valid without an email" do
      subject.email=nil
      expect(subject).to_not be_valid
    end
    it "is not valid without a first name" do
      subject.first_name=nil
      expect(subject).to_not be_valid
    end
    it "is not valid without a last name" do
      subject.last_name=nil
      expect(subject).to_not be_valid
    end
    it "is not valid without a password" do
      subject.password=nil
      expect(subject).to_not be_valid
    end
  end
