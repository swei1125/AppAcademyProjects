class TracksController < ApplicationController

  def show
    @track = Track.find(params[:id])
  end

  def new
    @track = Track.new
    @current_album = Album.find(params[:album_id])
  end

  def create
    @track = Track.new(track_params)
    @track.album_id = params[:track][:album].to_i
    if @track.save
      redirect_to track_url(@track)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :new
    end
  end

  def edit
    @track = Track.find(params[:id])
  end

  def update
    @track = Track.find(params[:id])
    @track.album_id = params[:track][:album].to_i
    if @track.update(track_params)
      redirect_to track_url(@track)
    else
      flash.now[:errors].errors.full_messages
      render :edit
    end
  end

  def destroy
    @track = Track.find(params[:id])
    album = @track.album
    Track.all.delete(@track)
    redirect_to album_url(album)
  end


  private
  def track_params
    params.require(:track).permit(:title, :ord, :lyrics, :track_type)
  end
end
