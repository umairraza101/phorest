require 'rails_helper'

RSpec.describe ClientsController, type: :controller do

  describe "#index" do
    it 'does returns a successful response' do
      allow_any_instance_of(PhorestApi).to receive(:clients).and_return(nil)
      get :index
      expect(response).to render_template(:index)
      expect(response).to have_http_status(:success)
      expect(assigns(:clients)).to be_nil
    end
  end
end

