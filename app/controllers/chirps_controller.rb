class ChirpsController < ApplicationController
  def index
    @chirps = Chirp.all.reverse
  end

  def create
    @chirp = Chirp.new(chirp_params)
    @chirp.user_id = Current.user.id
    if @chirp.save
      redirect_to action: "index"
    else
      render :index, status: :unprocessable_entity
    end

  end

  def show
  end

  def edit
    @chirp = Chirp.find(params[:id])
    if @chirp.user_id != Current.user.id
      redirect_to action: "index"
    end
  end

  def update
    @chirp = Chirp.find(params[:id])
    if @chirp.update(chirp_params)
      redirect_to action: "index"
    else
      render :index, status: :unprocessable_entity
    end
  end

  def delete
    @chirp = Chirp.find(params[:id])
    @chirp.destroy
    redirect_to action: "index"
  end

  def destroy
  end

  private
    def chirp_params
      params.expect(chirp: [ :message ])
    end

end
