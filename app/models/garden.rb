class Garden < ApplicationRecord
  has_many :plots

  def plants_under_100_days_to_harvest
    plots.joins(:plants)
         .select('plots.*, plants.name')
         .where('plants.days_to_harvest < ?', 100)
         .group('plants.id')
         .order('plants.name')
         .distinct
         .pluck('plants.name')
  end
end
