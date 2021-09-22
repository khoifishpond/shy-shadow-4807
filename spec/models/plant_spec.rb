require 'rails_helper'

describe Plant do
  describe 'relationships' do
    it { should have_many(:plots).through(:plot_plants) }
  end
end