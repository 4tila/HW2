# This file is app/controllers/movies_controller.rb
class MoviesController < ApplicationController
  def index
    if params.key?("ratings")
        session[:ratings] = params[:ratings]
        keys = params[:ratings].keys
        @movies = Movie.where(:rating=>keys[0])
        (1..(keys.length())).each do |i|
            @movies+=Movie.where(:rating=>keys[i])
        end
    else if session.key?("ratings")
        keys = session[:ratings].keys
        @movies = Movie.where(:rating=>keys[0])
        (1..(keys.length())).each do |i|
            @movies+=Movie.where(:rating=>keys[i])
        end
    else
        @movies = Movie
    end
    end
    if params.key?(:sort)
        if params[:sort]=="title"
            @movies = @movies.sort {|a,b| a.title<=>b.title}
        end
        if params[:sort]=="rating"
            @movies = @movies.sort {|a,b| a.rating<=>b.rating}
        end
        if params[:sort]=="release_date"
            @movies = @movies.sort {|a,b| a.release_date<=>b.release_date}
        end
    end
    return @movies
  end

  def show
    id = params[:id]
    @movie = Movie.find(id)
  end

  def new
    @movie = Movie.new
  end

  def create
    #@movie = Movie.create!(params[:movie]) #did not work on rails 5.
    print movie_params
    @movie = Movie.create(movie_params)
    flash.keep
    flash[:notice] = "#{@movie.title} was successfully created!"
    redirect_to movies_path
  end

  def movie_params
    params.require(:movie).permit(:title,:rating,:description,:release_date)
  end

  def edit
    id = params[:id]
    @movie = Movie.find(id)
    #@movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    #@movie.update_attributes!(params[:movie])#did not work on rails 5.
    @movie.update(movie_params)
    flash.keep
    flash[:notice] = "#{@movie.title} was successfully updated!"
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find params[:id]
    @movie.destroy
    flash.keep
    flash[:notice] = "#{@movie.title} was deleted!"
    redirect_to movies_path
  end
end
