require 'rails_helper'

RSpec.describe Garden do
  describe 'relationships' do
    it { should have_many(:plots) }
  end
  describe 'instance methods' do
    before(:each) do
      @garden = Garden.create!(name: 'Does Not Work', organic: false)
      @plot1 = @garden.plots.create!(number: 11, size: 'Large', direction: 'East')
      @plot2 = @garden.plots.create!(number: 12, size: 'Medium', direction: 'West')
      @plot3 = @garden.plots.create!(number: 13, size: 'Small', direction: 'North')
      @plot4 = @garden.plots.create!(number: 14, size: 'Large', direction: 'South')
      @plant1 = @plot1.plants.create!(name: 'Red', description: 'ASDFASDFASDF', days_to_harvest: 30)
      @plant2 = @plot1.plants.create!(name: 'Blue', description: 'ASDFASDFASDF', days_to_harvest: 30)
      @plant3 = @plot2.plants.create!(name: 'Green', description: 'ASDFASDFASDF', days_to_harvest: 30)
      @plant4 = @plot2.plants.create!(name: 'Red', description: 'ASDFASDFASDF', days_to_harvest: 30)
      @plant5 = @plot3.plants.create!(name: 'Yellow', description: 'ASDFASDFASDF', days_to_harvest: 30)
      @plant6 = @plot3.plants.create!(name: 'Black', description: 'ASDFASDFASDF', days_to_harvest: 30)
      @plant7 = @plot4.plants.create!(name: 'Orange', description: 'ASDFASDFASDF', days_to_harvest: 30)
      @plant8 = @plot4.plants.create!(name: 'White', description: 'ASDFASDFASDF', days_to_harvest: 30)
  end
    it '#plants_under_100_days_to_harvest' do
      expected = [
        @plant6.name,
        @plant2.name,
        @plant3.name,
        @plant7.name,
        @plant1.name,
        @plant8.name,
        @plant5.name
      ]
      expect(@garden.plants_under_100_days_to_harvest).to eq(expected)
    end
  end
end
