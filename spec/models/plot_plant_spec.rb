require 'rails_helper'

describe PlotPlant do
  describe 'relationships' do
    it { should belong_to(:plot) }
    it { should belong_to(:plant) }
  end
end