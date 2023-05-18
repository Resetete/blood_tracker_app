# frozen_string_literal: true

# this allows to define if a link is a url to a text generator
class AddTextGeneratorToLinks < ActiveRecord::Migration[7.0]
  def change
    add_column :links, :text_generator, :boolean
  end
end
