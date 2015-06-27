RSpec.describe SamplesController, :type => :controller do
  render_views

  describe do
    it "no error message" do
      get :index
      expect(response.body).not_to include('.error-message')
    end
  end
end