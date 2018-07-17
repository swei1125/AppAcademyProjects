class AlbumsController < ApplicationController


  def show
    @album = Album.find(params[:id])
  end

  def new
    @album = Album.new
    @current_band = Band.find(params[:band_id])
  end

  def create
    @album = Album.new(album_params)
    @album.band_id = params[:album][:band].to_i
    if @album.save
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :new
    end
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])
    @album.band_id = params[:album][:band].to_i
    if @album.update(album_params)
      redirect_to album_url(@album)
    else
      flash.now[:errors].errors.full_messages
      render :edit
    end
  end

  def destroy
    @album = Album.find(params[:id])
    band = @album.band
    Album.all.delete(@album)
    redirect_to band_url(band)
  end

  # def current_band
  #   @band = Band.find(params[:album][:band].id)
  # end
  private

  def album_params
    params.require(:album).permit(:title, :year, :alb_type)
  end
end
