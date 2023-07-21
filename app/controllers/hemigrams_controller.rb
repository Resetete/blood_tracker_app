# frozen_string_literal: true

# CRUDs for the different hemigrams that store the blood work user data
class HemigramsController < ApplicationController
  before_action :set_hemigram, only: %i[show edit update destroy]

  def index
    @hemigrams = Hemigram.search(params[:search], current_user).paginate(page: params[:page]).order('id DESC')
  end

  def new
    @hemigram = Hemigram.new
  end

  def show; end

  def create
    @hemigram = Hemigram.new(hemigram_params)
    @hemigram.user_id = current_user.id
    @hemigram.short = Hemigram.short(@hemigram.parameter)

    if @hemigram.save
      redirect_to hemigram_path(@hemigram), notice: 'Hemigram was successfully created.'
    else
      render :new, status: :unprocessable_entity # need the status to show errors with turbo
    end
  end

  def edit; end

  def update
    if @hemigram.update(hemigram_params)
      flash[:notice] = 'You have successfully updated your hemigram'
      redirect_to @hemigram
    else
      render 'edit'
    end
  end

  def destroy
    flash[:notice] = 'You have successfully deleted that hemigram.' if @hemigram.destroy
    redirect_to hemigrams_path
  end

  private

  def hemigram_params
    params.require(:hemigram).permit(:parameter, :value, :unit, :date)
  end

  def set_hemigram
    @hemigram = Hemigram.find(params[:id])
  end
end
