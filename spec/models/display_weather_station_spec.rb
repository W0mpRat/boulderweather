require "rails_helper"

RSpec.describe DisplayWeatherStation, :type => :model do
  describe "#stations" do
    before do
      @station_ids = DisplayWeatherStation.station_ids(:meso_west)
    end

    it 'gives a list of meso_west station ids' do
      expect(@station_ids).to include('BTAC2')
    end

    it 'is a list of station hashes' do
      sugarloaf = DisplayWeatherStation.stations[:meso_west][:sugarloaf]
      expect(sugarloaf[:id]).to eq('BTAC2')
    end
  end
end