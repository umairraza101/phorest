class ClientsController < ApplicationController

  def index
    @clients = phorest_api.clients(params[:email], params[:phone])
  end

end
