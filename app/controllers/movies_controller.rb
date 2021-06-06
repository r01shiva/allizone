# frozen_string_literal:true

class MoviesController < ApplicationController
  before_action :find_movie, only: %i[edit update destroy]
  before_action :build_movie, only: %i[new create]
  def index
    @movies_collection = movies_collection
    render 'movies/index'
  end

  def new
    render 'movies/new'
  end

  def create
    if @resource.update(resource_params)
      flash[:success] = 'Movie has been created successfully.'
      redirect_to movies_path
    else
      error_flash @resource
      render 'movies/edit'
    end
  end

  def edit
    if @resource.blank?
      redirect_to movies_path
    else
      render 'movies/edit'
    end
  end

  def update
    if @resource.blank?
      redirect_to movies_path
    else


      if @resource.update(resource_params)
        flash[:success] = 'Movie has been updated successfully.'
        redirect_to movies_path
      else
        error_flash @resource
        render 'movies/edit'
      end
    end
  end

  def destroy
    flash[:success] = 'Movie deleted successfully.' if @resource.destroy
    redirect_to movies_path
  end

  private
  def movies_collection
    Movie.all.order(:created_at)
  end

  def find_movie
    @resource = movies_collection.find_by(id: params[:id])
    flash[:error] = 'Movie not found' if @resource.blank?
  end

  def resource_params
    params.require(:movie).permit(
      :name, :file
    )
  end

  def build_movie
    @resource = Movie.new
  end
end
