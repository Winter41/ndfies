class ArtistsController < ApplicationController
  def index
    @artist = Artist.all
  end
end
