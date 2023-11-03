# frozen_string_literal: true

# == Schema Information
#
# Table name: hemigrams_chart_settings
#
#  id            :bigint           not null, primary key
#  parameter_ids :integer          default([]), is an Array
#  user_id       :bigint           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

# Set ups setting for the charts for a specific user
# e.g. which charts should be displayed
module Hemigrams
  class ChartSetting < ApplicationRecord
    self.table_name = 'hemigrams_chart_settings'

    belongs_to :user, dependent: :destroy
  end
end
