# frozen_string_literal: true

# Responsible to render and visualize the graphical visualization of the blood work data (Hemigrams)
class GraphsController < ApplicationController
  def index
    # works, but is not using the api endpoint

    @data = Hemigram.all.group_by{|h| h.parameter}.map{ |parameter, group| {name: parameter, data: group.map{|entry| [entry.date.to_date,entry.value.to_i]}}}.compact.flatten
  end

  def parameters_per_day
    binding.pry
    raw_data = Hemigram.unit_converter(Hemigram.where(user_id: current_user, parameter: params[:parameter]))
    chart_data = raw_data.map { |i| [i[:date], i[:value], i[:unit]] }
    render json: chart_data

    # works:
    # render json: Hemigram.where(user_id: current_user, parameter: params[:parameter])
    # .group(:parameter)
    # .group_by_day(:date).maximum(:value)
  end
end
