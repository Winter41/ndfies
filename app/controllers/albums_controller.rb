class AlbumsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_artist
  def index
  end

  def show
    @album = @artist.albums.find params[:id]
  end

  def new
    @album = @artist.albums.new
  end

  def create
    @album = @artist.albums.create(album_params)

    if @album.save
      redirect_to @artist
    else
      render :new
    end
  end

  private
  def set_artist
    @artist = Artist.find params[:artist_id]
  end
  def album_params
    params.require(:album).permit(:name)
  end
end
