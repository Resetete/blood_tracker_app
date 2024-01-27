# frozen_string_literal: true

# CRUDs for the different hemigrams that store the blood work user data
class HemigramsController < ApplicationController
  include WillPaginate::CollectionMethods

  before_action :set_hemigram, only: %i[show edit update destroy]

  def index
    hemigrams = Hemigram.search(params[:search], current_user)
    @hemigrams = Hemigram.where(id: hemigrams.map(&:id))
                         .order(date: :desc)
                         .paginate(page: params[:page], per_page: 10)
  end

  def new
    @hemigram = Hemigram.new
  end

  def show; end

  def create
    @hemigram = current_user.hemigrams.build(hemigram_params)
    @hemigram.short = Admin::Hemigrams::ParameterMetadata.short(@hemigram.parameter)
    @hemigram.hemigrams_parameter_associations.build(parameter_metadata:)

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
    @hemigram.destroy

    respond_to do |format|
      format.html { redirect_to hemigrams_path, flash[:notice] = 'You have successfully deleted that hemigram.' }
      format.turbo_stream
    end
  end

  def get_unit_selection_dropdown_options
    parameter = params[:parameter_select].to_sym

    options = Admin::Hemigrams::ParameterMetadata.units(parameter)
    shorts = Admin::Hemigrams::ParameterMetadata.short(parameter)

    render json: { options:, shorts: }
  end

  private

  def hemigram_params
    params.require(:hemigram).permit(:parameter, :value, :unit, :date)
  end

  def set_hemigram
    @hemigram = Hemigram.find(params[:id])
  end

  def parameter_metadata
    Admin::Hemigrams::ParameterMetadata.find_by(parameter_name: @hemigram.parameter)
  end
end
