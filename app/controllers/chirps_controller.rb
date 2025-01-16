class ChirpsController < ApplicationController
  def index
    @chirps = Chirp.all
  end

  def create
    @chirp = Chirp.new(chirp_params)
    @chirp.user_id = Current.user.id
    if @chirp.save
      redirect_to chirps_index_url
    else
      render :index, status: :unprocessable_entity
    end

  end

  def show
  end

  def edit
  end

  def update
  end

  def delete
  end

  def destroy
  end

  private
    def chirp_params
      params.expect(chirp: [ :message ])
    end

end
