class BeatsController < ApplicationController
  before_action :authenticate_user!

  def index
    render json: Beat.all.with_attached_file
  end

  def create
    beat = current_user.beats.create!(beat_params)
    render json: beat
  end

  private

  def beat_params
    params.require(:beat).permit(:title, :file, :price)
  end
end