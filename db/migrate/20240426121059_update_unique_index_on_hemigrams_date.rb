# frozen_string_literal: true

class UpdateUniqueIndexOnHemigramsDate < ActiveRecord::Migration[7.0]
  def change
    remove_index :hemigrams, name: :index_hemigrams_on_record_date_id_and_parameter
    add_index :hemigrams, %i[record_date_id parameter user_id], unique: true
  end
end
