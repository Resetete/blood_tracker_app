# frozen_string_literal: true

# CRUDs for the different hemigrams that store the blood work user data
class HemigramsController < ApplicationController
  include WillPaginate::CollectionMethods

  before_action :set_hemigram, only: %i[show edit update destroy]
  before_action :set_hemigram_date, only: %i[new create edit update]

  def index
    hemigrams = Hemigram.search(params[:search], current_user)
    @hemigrams = Hemigram.where(id: hemigrams.map(&:id))
                         .order(date: :desc)
                         .paginate(page: params[:page], per_page: 10)
  end

  def new
    @hemigram = @hemigram_date.hemigrams.build
  end

  def show; end

  def create
    @hemigram = @hemigram_date.hemigrams.build(hemigram_params.merge({ user: current_user }))
    @hemigram.short = Admin::Hemigrams::ParameterMetadata.short(@hemigram.parameter)
    @hemigram.hemigrams_parameter_associations.build(parameter_metadata:)

    if @hemigram.save
      respond_to do |format|
        format.html { redirect_to hemigrams_path, notice: ErrorHandling::SUCCESSFUL_CREATE }
        format.turbo_stream { flash.now[:notice] = ErrorHandling::SUCCESSFUL_CREATE }
      end
    else
      render :new, status: :unprocessable_entity # need the status to show errors with turbo
    end
  end

  def edit; end

  def update
    # get the date from the params, check if we already have a Hemigram::Date for the submitted date and user
    record_date = Hemigrams::Date.find_or_initialize_by(date: params[:hemigram][:record_date][:date], user_id: current_user.id)
    # set the record_date for the hemigram
    @hemigram.record_date = record_date
    # set the abbreviation for the updated parameter
    @hemigram.short = Admin::Hemigrams::ParameterMetadata.short(hemigram_params[:parameter])

    if @hemigram.update(hemigram_params)
      @hemigram_dates = current_user.record_dates.joins(:hemigrams).order(date: :desc)
      respond_to do |format|
        format.html { redirect_to hemigrams_path, flash[:notice] = ErrorHandling::SUCCESSFUL_UPDATE }
        format.turbo_stream { flash.now[:notice] = ErrorHandling::SUCCESSFUL_UPDATE }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @hemigram.destroy

    respond_to do |format|
      format.html { redirect_to hemigrams_path, flash[:notice] = 'You have successfully deleted that hemigram.' }
      format.turbo_stream { flash.now[:notice] = 'You have successfully deleted that hemigram.' }
    end
  end

  def get_unit_selection_dropdown_options
    parameter = params[:parameter_select].to_sym
    hemigram_id = params[:hemigram_id]

    options = Admin::Hemigrams::ParameterMetadata.units(parameter)
    shorts = Admin::Hemigrams::ParameterMetadata.short(parameter)

    respond_to do |format|
      format.html { render('hemigrams/frames/unit_form_select', locals: { options:, shorts:, hemigram_id: }) }
    end
  end

  private

  def hemigram_params
    params.require(:hemigram).permit(:parameter, :value, :unit)
  end

  def set_hemigram
    # ensure that a user can only manipulate their own hemigrams
    @hemigram = current_user.hemigrams.find(params[:id])
  end

  def parameter_metadata
    Admin::Hemigrams::ParameterMetadata.find_by(parameter_name: @hemigram.parameter)
  end

  def set_hemigram_date
    @hemigram_date = current_user.record_dates.find(params[:hemigram_date_id])
  end
end
