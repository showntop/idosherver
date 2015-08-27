require 'rails_helper'

RSpec.describe "Admin::Identities", type: :request do
  describe "GET /admin_identities" do
    it "works! (now write some real specs)" do
      get admin_identities_path
      expect(response).to have_http_status(200)
    end
  end
end
