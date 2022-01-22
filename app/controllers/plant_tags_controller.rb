class PlantTagsController < ApplicationController
  def new
    # populate the form
    @plant = Plant.find(params[:plant_id])
    @plant_tag = PlantTag.new
  end

  def create
    @plant = Plant.find(params[:plant_id])

    # find all the tags coming from the form
    @tags = Tag.find( params[:plant_tag][:tag_id] )
    # for each tag
    @tags.each do |tag|
      # create a new plant_tag with that tag that was chosen in the form
      PlantTag.create(plant: @plant, tag: tag)
    end

    redirect_to garden_path(@plant.garden.id)
  end

  private

  def strong_params
    params.require(:plant_tag).permit(:tag_id)
  end
end
