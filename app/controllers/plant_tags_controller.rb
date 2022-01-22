class PlantTagsController < ApplicationController
  def new
    # populate the form
    @plant = Plant.find(params[:plant_id])
    @plant_tag = PlantTag.new
  end

  def create
    @plant_tag = PlantTag.new # (strong_params)
    @plant = Plant.find(params[:plant_id])
    @plant_tag.plant = @plant

    # find all the tags coming from the form
    @tags = Tag.find( params[:plant_tag][:tag_id] )
    # for each tag
    @tags.each do |tag|
      # create a new plant_tag with that tag that was chosen in the form
      PlantTag.create(plant: @plant, tag: tag)
    end

    redirect_to garden_path(@plant.garden.id)

    # if @plant_tag.save! # return "true" or RAISE and error
    # if @plant_tag.save! # return true or false
    #   redirect_to garden_path(@plant.garden.id)
    # else
    #   render :new
    # end
  end

  private

  def strong_params
    params.require(:plant_tag).permit(:tag_id)
  end
end
