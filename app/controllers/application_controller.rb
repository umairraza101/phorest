class ApplicationController < ActionController::Base

  def phorest_api
    PhorestApi.new
  end
end
