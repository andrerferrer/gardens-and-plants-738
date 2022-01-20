class PlantsController < ApplicationController
  # NESTED RESOURCES
  def new
    # find the parent
    @garden = Garden.find params[:garden_id]
    # create an empty child
    @plant = Plant.new
  end

  def create
    @plant = Plant.new(strong_params)
    # BECAUSE ITS NESTED
    # find the parent
    @garden = Garden.find params[:garden_id]
    
    @plant.garden = @garden

    if @plant.save
      redirect_to garden_path(@garden)
    else
      render :new
    end
  end

  def destroy
    @plant = Plant.find params[:id]
    @plant.destroy
    redirect_to garden_path(@plant.garden.id)
  end

  private

  # the filter of what comes from the form
  def strong_params
    # require the model
    params.require(:plant)
    # permit the columns
          .permit(:name, :photo_url)
  end
end
