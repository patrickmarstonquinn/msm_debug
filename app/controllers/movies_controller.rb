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

    # @movie.title = params[:title]
    # @movie.year = params[:year]
    # @movie.duration = params[:duration]
    # @movie.description = params[:description]
    # @movie.image_url = params[:image_url]
    # @movie.director_id = params[:director_id]

    @title = params[:title]
    @year = params[:year]
    @duration = params[:duration]
    @description = params[:description]
    @movie = params[:image_url]
    @movie = params[:director_id]

    @movie.title = params[:title]
    @movie.year = params[:year]
    @movie.duration = params[:duration]
    @movie.description = params[:description]
    @movie.image_url = params[:image_url]
    @movie.director_id = params[:director_id]

    @id = params["id"]
        @name = params[:name]
        @dob = params[:dob]
        @bio = params[:bio]
        @image_url = params[:image_url]
        a = Actor.find(@id)
        a.name = @name
        a.dob = @dob
        a.bio = @bio
        a.image_url = @image_url
        a.save
        redirect_to("/actor/#{@id}")


    render("show")
  end

  def destroy
    movie = Movie.find(params[:id])
    movie.destroy
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
