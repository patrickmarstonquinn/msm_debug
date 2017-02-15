class ActorsController < ApplicationController
  def index
    @actors = Actor.all
  end

  def show
    @actor = Actor.find(params[:id])
  end

  def new_form
  end

  def create_row
    @actor = Actor.new
    @actor.dob = params[:dob]
    @actor.name = params[:name]
    @actor.bio = params[:bio]
    @actor.image_url = params[:image_url]

    @actor.save

    render("show")
  end

  def edit_form
    @actor = Actor.find(params[:id])
  end

  def update_row

    @id = params["id"]
    @name = Actor.find(@id).name
    @dob = Actor.find(@id).dob
    @bio = Actor.find(@id).bio
    @image_url = Actor.find(@id).image_url
    a = Actor.find(@id)
    a.name = params[:name]
    a.dob = params[:dob]
    a.bio = params[:bio]
    a.image_url = params[:image_url]
    a.save

    redirect_to("/actors/#{@id}")
  end

  def destroy
    @actor = Actor.find(params[:id])

    @actor.destroy
  end
end
