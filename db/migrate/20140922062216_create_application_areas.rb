class CreateApplicationAreas < ActiveRecord::Migration
  def change
    create_table :application_areas do |t|
      t.string :name
      t.timestamps
    end

    add_reference :questions, :application_area, index_connected: true
  end
end
