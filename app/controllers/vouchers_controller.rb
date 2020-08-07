class VouchersController < ApplicationController

  def new
    @voucher = OpenStruct.new(client_id: params[:id], amount: 0)
  end

  def create
    @voucher = phorest_api.create_voucher(params[:amount], params[:client_id])
    if @voucher.statusCode.present?
      flash[:error] = @voucher.detail
      render :new
    else
      flash[:notice] = "voucher successfully created"
      redirect_to root_path

    end
  end

end
