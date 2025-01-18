class ChirpsController < ApplicationController
  def index
    @chirps = Chirp.all
  end

  def create
    @chirp = Chirp.new(chirp_params)
    @chirp.user_id = Current.user.id
    if @chirp.save
      redirect_to :index
    else
      render :index, status: :unprocessable_entity
    end

  end

  def show
  end

  def edit
    @chirp = Chirp.find(params[:id])
    if @chirp.user_id != Current.user.id
      redirect_to :index
    end
  end

  def update
    @chirp = Chirp.find(params[:id])
    if @chirp.update(chirp_params)
      redirect_to :index
    else
      render :index, status: :unprocessable_entity
    end
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
