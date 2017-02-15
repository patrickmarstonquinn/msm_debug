class DirectorsController < ApplicationController
  def index
    @directors = Director.all
    render("directors/index.html.erb")
  end

  def show
    @id = params["id"]
    @dob = Director.find(@id).dob
    @name = Director.find(@id).name
    @bio = Director.find(@id).bio
    @image_url = Director.find(@id).image_url
    render("directors/show_details.html.erb")
  end

  def new_form
    render("directors/new_form.html.erb")
  end

  def create_row
    d = Director.new
    d.dob = params[:dob]
    d.name = params[:name]
    d.bio = params[:bio]
    d.image_url = params[:image_url]
    d.save
    redirect_to("http://localhost:3000/directors")
  end

  def edit_form
    @director = Director.find(params[:id])
  end

  def update_row

    @id = params["id"]
    @name = Director.find(@id).name
    @dob = Director.find(@id).dob
    @bio = Director.find(@id).bio
    @image_url = Director.find(@id).image_url
    d = Director.find(@id)
    d.name = params[:name]
    d.dob = params[:dob]
    d.bio = params[:bio]
    d.image_url = params[:image_url]
    d.save
    
    redirect_to("/directors/#{@id}")
  end

  def destroy
    @director = Director.find(params[:id])

    @director.destroy
  end
end
