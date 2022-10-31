require 'rails_helper'

RSpec.describe "Storages", type: :request do
  describe "GET /storages" do
    it "works! (now write some real specs)" do
      get storages_path
      expect(response).to have_http_status(200)
    end
  end
end
