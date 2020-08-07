class ClientsController < ApplicationController

  def index
    @clients = phorest_api.clients
  end

end
