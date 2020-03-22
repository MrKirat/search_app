require 'rails_helper'

RSpec.describe "ProgrammingLanguages", type: :request do
  describe "GET /programming_languages" do
    it "works! (now write some real specs)" do
      get programming_languages_path
      expect(response).to have_http_status(200)
    end
  end
end
