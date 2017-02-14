class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    render("movies/index.html.erb")
  end

  def new_form
    render("/movies/new_form.html.erb")
  end

  def create_row
    m = Movie.new
    m.title = params[:title]
    m.year = params[:year]
    m.duration = params[:duration]
    m.description = params[:description]
    m.image_url = params[:image_url]
    m.director_id = params[:director_id]
    m.save
    redirect_to("http://localhost:3000/movies")
  end

  def edit_form
    @movie = Movie.find(params[:id])
  end

  def update_row

    @id = params["id"]
    @title = Movie.find(@id).title
    @year = Movie.find(@id).year
    @duration = Movie.find(@id).duration
    @description = Movie.find(@id).description
    @image_url = Movie.find(@id).image_url
    @director_id = Movie.find(@id).director_id
    # @movie = params[:director_id]
    m = Movie.find(@id)
    m.title = params[:title]
    m.year = params[:year]
    m.duration = params[:duration]
    m.description = params[:description]
    m.image_url = params[:image_url]
    m.director_id = params[:director_id]
    m.save


    redirect_to("/movies/#{@id}")

    #   @id = params["id"]
    # @title = Movie.find(@id).title
    # @year = Movie.find(@id).year
    # @duration = Movie.find(@id).duration
    # @description = Movie.find(@id).description
    # @image_url = Movie.find(@id).image_url
    # m = Movie.find(@id)
    # m.title = params[:title]
    # m.year = params[:year]
    # m.duration = params[:duration]
    # m.image_url = params[:image_url]
    # m.description = params[:description]
    # m.save
    # redirect_to("/movie/#{@id}")
  end

  def destroy
    @id = params[:id]
    m = Movie.find(@id)
    m.destroy
    redirect_to("movies.html.erb")
  end

  def show
    @id = params["id"]
    @title = Movie.find(@id).title
    @year = Movie.find(@id).year
    @duration = Movie.find(@id).duration
    @description = Movie.find(@id).description
    @image_url = Movie.find(@id).image_url

    render("movies/show.html.erb")
  end
end
