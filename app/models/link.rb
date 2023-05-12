# == Schema Information
#
# Table name: links
#
#  id                        :bigint           not null, primary key
#  name                      :string           not null
#  url                       :string           not null
#  blood_cell_description_id :bigint
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#
# This stores links / urls to information sources
class Link < ApplicationRecord
  belongs_to :blood_cell_description
end
