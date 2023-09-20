class BuildingsController < ApplicationController 
  def index
    @buildings = Building.all
    @building = Building.new
  end

  def show
    @building = Building.find(params[:id])
  end

  def new
    @building = Building.new
  end

  def create
    @building = Building.new(building_params)

    respond_to do |format|
      if @building.save
        format.html { redirect_to buildings_url, notice: "Building was successfully created" }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @building = Building.find(params[:id])
  end

  def update
    @building = Building.find(params[:id])

    respond_to do |format|
      if @building.update(building_params)
        format.html { redirect_to buildings_url, notice: "Building was successfully updated" }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @building = Building.find(params[:id])
    @building.destroy

    redirect_to buildings_path, notice: "Building was successfully deleted"
  end

  private
    def building_params
      params.require(:building).permit(:title, :description)
    end
end