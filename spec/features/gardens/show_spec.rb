require 'rails_helper'

describe 'garden show page' do
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
    
    visit garden_path(@garden)
  end

  it 'lists all plants in garden' do
    save_and_open_page
    expect(page).to have_content(@plant1.name)
    expect(page).to have_content(@plant2.name)
    expect(page).to have_content(@plant3.name)
    expect(page).to have_content(@plant4.name)
    expect(page).to have_content(@plant5.name)
    expect(page).to have_content(@plant6.name)
    expect(page).to have_content(@plant7.name)
    expect(page).to have_content(@plant8.name)
  end
end