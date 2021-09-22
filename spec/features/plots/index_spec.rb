describe 'plots index page' do
  before(:each) do
    @garden = Garden.create!(name: 'Does Not Work', organic: false)
    @plot1 = @garden.plots.create!(number: 11, size: 'Large', direction: 'East')
    @plot2 = @garden.plots.create!(number: 12, size: 'Medium', direction: 'West')
    @plot3 = @garden.plots.create!(number: 13, size: 'Small', direction: 'North')
    @plot5 = @garden.plots.create!(number: 14, size: 'Large', direction: 'South')

    visit plots_path
  end
  
  it 'lists all plot numbers' do
    expect(page).to have_content(@plot1.number)
    expect(page).to have_content(@plot2.number)
    expect(page).to have_content(@plot3.number)
    expect(page).to have_content(@plot4.number)
  end
end