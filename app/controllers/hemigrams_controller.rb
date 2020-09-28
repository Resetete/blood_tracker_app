class HemigramsController < ApplicationController
  before_action :set_hemigram, only: [:show]

  def index
    @all_user_hemigrams = current_user.hemigrams
  end

  def new
    @hemigram = Hemigram.new
  end

  def show
  end

  def create
    @hemigram = Hemigram.new(hemigram_params)
    @hemigram.user_id = current_user.id

    if @hemigram.save
      flash[:notice] = 'You successfully saved your hemigram'
      redirect_to @hemigram
    else
      flash[:alert] = 'Something went wrong, please try again'
      redirect_to new_hemigram_path
    end
  end

  private

  def hemigram_params
    params.require(:hemigram).permit(:parameter, :value, :date)
  end

  def set_hemigram
    @hemigram = Hemigram.find(params[:id])
  end
end
