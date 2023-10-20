# frozen_string_literal: true

# CRUDs for the different hemigrams that store the blood work user data
class HemigramsController < ApplicationController
  include WillPaginate::CollectionMethods

  before_action :set_hemigram, only: %i[show edit update destroy]

  def index
    hemigrams = Hemigram.search(params[:search], current_user)
    # convert search result into an activerecord relation to allow pagination
    @hemigrams = Hemigram.where(id: hemigrams.map(&:id))
                         .paginate(page: params[:page])
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
      redirect_to hemigrams_path, notice: ErrorHandling::SUCCESSFUL_CREATE
    else
      render :new, status: :unprocessable_entity # need the status to show errors with turbo
    end
  end

  def edit; end

  def update
    if @hemigram.update(hemigram_params)
      flash[:notice] = ErrorHandling::SUCCESSFUL_UPDATE
      redirect_to hemigrams_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    flash[:notice] = 'You have successfully deleted that hemigram.' if @hemigram.destroy
    redirect_to hemigrams_path
  end

  def get_unit_selection_dropdown_options
    parameter_dropdown_selection = params[:parameter_select].to_sym

    options = Hemigram.units(parameter_dropdown_selection)

    render json: options
  end

  private

  def hemigram_params
    params.require(:hemigram).permit(:parameter, :value, :unit, :date)
  end

  def set_hemigram
    @hemigram = Hemigram.find(params[:id])
  end
end
