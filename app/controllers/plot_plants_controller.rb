class PlotPlantsController < ApplicationController
  def destroy
    plot = Plot.find(params[:plot_id])
    plot.plants.destroy(params[:id])
    
    redirect_to plots_path
  end
end