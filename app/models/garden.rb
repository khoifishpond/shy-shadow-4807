class Garden < ApplicationRecord
  has_many :plots

  def plants
    a = plots.joins(:plants)
  end
end
