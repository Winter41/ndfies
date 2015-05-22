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

  def edit
    @album = @artist.albums.find params[:id]
  end

  def update
    @album = @artist.albums.find params[:id]
    if @album.update(album_params)
      flash[:success] = "Successfully updated an album!"
      redirect_to artist_album_path(@album.artist, @album)
    else
      flash[:error] = @album.errors.full_messages.to_sentence
      render :edit
    end
  end

  def create
    @album = @artist.albums.create(album_params)

    if @album.save
      flash[:success] = "Successfully created an album!"
      redirect_to artist_album_path(@album.artist, @album)
    else
      flash[:error] = @album.errors.full_messages.to_sentence
      render :new
    end
  end

  def destroy
    @album = @artist.albums.find params[:id]
    @album.destroy
    redirect_to @artist
  end

  private

  def set_artist
    @artist = Artist.find params[:artist_id]
  end

  def album_params
    params.require(:album).permit(:name)
  end
end
