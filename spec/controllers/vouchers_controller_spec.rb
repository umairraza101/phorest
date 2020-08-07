require 'rails_helper'

RSpec.describe VouchersController, type: :controller do

  describe "#new" do
    it 'does returns a successful response' do
      get :new, params: {id: "1"}
      expect(response).to render_template(:new)
      expect(response).to have_http_status(:success)
      expect(assigns(:voucher).client_id).to eq("1")
      expect(assigns(:voucher).amount).to eq(0)
    end
  end

  describe "#create" do
    context 'when success' do
      it 'does returns a successful response' do
        allow_any_instance_of(PhorestApi).to receive(:create_voucher).and_return(nil)
        post :create, params: {id: "1", amount: 0}
        expect(response).to redirect_to(root_path)
        expect(request.flash[:notice]).to eq('Voucher successfully created')
        expect(response).to have_http_status(:redirect)
      end
    end

    context 'when error' do
      it 'does returns a error response' do
        voucher = OpenStruct.new(statusCode: 400, detail: 'error message')
        allow_any_instance_of(PhorestApi).to receive(:create_voucher).and_return(voucher)
        post :create, params: {id: "1", amount: 0}
        expect(response).to render_template(:new)
        expect(request.flash[:error]).to eq(voucher.detail)
      end
    end
  end

end

