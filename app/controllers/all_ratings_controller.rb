class AllRatingsController < ApplicationController
  #before_action :set_all_rating, only: [:show, :edit, :update, :destroy]

  # GET /all_ratings
  # GET /all_ratings.json
  def index
    @all_ratings = AllRating.all
  end

  # GET /all_ratings/1
  # GET /all_ratings/1.json
  def show
  end

  # GET /all_ratings/new
  def new
    @all_rating = AllRating.new
  end

  # GET /all_ratings/1/edit
  def edit
  end

  # POST /all_ratings
  # POST /all_ratings.json
  def create
    @all_rating = AllRating.new(all_rating_params)

    respond_to do |format|
      if @all_rating.save
        format.html { redirect_to @all_rating, notice: 'All rating was successfully created.' }
        format.json { render :show, status: :created, location: @all_rating }
      else
        format.html { render :new }
        format.json { render json: @all_rating.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /all_ratings/1
  # PATCH/PUT /all_ratings/1.json
  def update
    respond_to do |format|
      if @all_rating.update(all_rating_params)
        format.html { redirect_to @all_rating, notice: 'All rating was successfully updated.' }
        format.json { render :show, status: :ok, location: @all_rating }
      else
        format.html { render :edit }
        format.json { render json: @all_rating.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /all_ratings/1
  # DELETE /all_ratings/1.json
  def destroy
    @all_rating.destroy
    respond_to do |format|
      format.html { redirect_to all_ratings_url, notice: 'All rating was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_all_rating
    @all_rating = AllRating.find(params[:id])
  end
  
  # Never trust parameters from the scary internet, only allow the white list through.
  def all_rating_params
    params.require(:rating).permit(:title)
  end
end
