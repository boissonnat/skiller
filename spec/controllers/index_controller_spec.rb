require 'rails_helper'

RSpec.describe IndexController, :type => :controller do
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the public template" do
      get :index
      expect(response).to render_template("public")
    end
  end
end
