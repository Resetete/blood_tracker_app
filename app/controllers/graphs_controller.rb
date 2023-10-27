# frozen_string_literal: true

# Responsible to render and visualize the graphical visualization of the blood work data (Hemigrams)
class GraphsController < ApplicationController
  def index
    @user_parameters = user_hemigrams.pluck(:parameter).uniq
    @charts_data = prepare_charts_data
  end

  private

  def prepare_charts_data
    raw_data = user_hemigrams
    charts_data = raw_data.group_by { |h| h.parameter }
      .map do |parameter, group|
        {
          name: parameter,
          data: group
            .sort_by { |entry| entry.date }
            .map { |entry| [entry.date.to_date, entry.chart_value.to_i] }
        }
      end.compact.flatten
    charts_data
  end

  def user_hemigrams
    Hemigram.for_user(current_user)
  end
end
