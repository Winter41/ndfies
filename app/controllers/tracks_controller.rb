class TracksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_album

  def new
  end

  def show
    @track = @album.tracks.find params[:id]
  end

  def edit
    @track = @album.tracks.find params[:id]
  end

  def update
    @track = @album.tracks.find params[:id]
    if @track.update(track_params)
      flash[:success] = "Successfully updated track!"
      redirect_to album_track_path(@album, @track)
    else
      flash[:error] = @track.errors.full_messages.to_sentence
      render :new
    end
  end

  def create
    @track = @album.tracks.create(track_params)
    if @track.save
      flash[:success] = "Successfully created a new track!"
      redirect_to album_track_path(@album, @track)
    else
      flash[:error] = @track.errors.full_messages.to_sentence
      render :new
    end
  end


  def destroy
    @track = @album.tracks.find params[:id]
    @track.destroy
    redirect_to root_path
  end

  private

  def set_album
    @album = Album.find params[:album_id]
  end

  def track_params
    params.require(:track).permit(:name)
  end
end
