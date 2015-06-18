class ArtistsController < ApplicationController
  before_action :authenticate_user!

  def index
    #@artists = Artist.all
    @artists = Artist.paginate(page: params[:page], per_page: 5)
  end

  def show
    @artist = Artist.find params[:id]
  end

  def new
    @artist = Artist.new
  end

  def edit
    @artist = Artist.find params[:id]
  end

  def update
    @artist = Artist.find params[:id]
    if @artist.update(artist_params)
      flash[:success] = "Successfully updated an artist!"
      redirect_to artists_path
    else
      flash[:error] = @artist.errors.full_messages.to_sentence
      render :edit
    end
  end

  def create
    @artist = Artist.create(artist_params)

    if @artist.save
      flash[:success] = "Successfully created an artist!"
      redirect_to @artist
    else
      flash[:error] = @artist.errors.full_messages.to_sentence
      render :new
    end
  end

  def destroy
    @artist = Artist.find params[:id]
    @artist.destroy
    flash[:success] = "Successfully deleted an artist!"
    redirect_to artists_path
  end

  private
  def artist_params
    params.require(:artist).permit(:name)
  end

end
