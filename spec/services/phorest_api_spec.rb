require 'rails_helper'

RSpec.describe PhorestApi, type: :model do

  before do
    @phorest_api = PhorestApi.new
  end

  describe '#credential' do
    it 'does set headers and auth' do
      expect(@phorest_api.credential(:endpoint)).not_to be_nil
    end
  end

end
