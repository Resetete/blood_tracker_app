# frozen_string_literal: true

class CreateHemigramsParameterAssociations < ActiveRecord::Migration[7.0]
  def change
    create_table :hemigrams_parameter_associations do |t|
      t.references :hemigram, null: false, foreign_key: { to_table: :hemigrams, name: 'hemigram_fk' }
      t.references :parameter_metadata, null: false,
                                        foreign_key: { to_table: 'hemigrams_parameter_metadata', name: 'parameter_metadata_fk' }

      t.timestamps
    end
  end
end
