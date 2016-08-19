require "rails_helper"
RSpec.describe HomeController do

  describe "GET index" do

    it "renders the index template" do
      get :index, xhr: true
      expect(response).to render_template("index")
    end

    it "has http status 200" do
      get :index, xhr: true
      expect(response).to have_http_status(:success)
    end
  end
end
