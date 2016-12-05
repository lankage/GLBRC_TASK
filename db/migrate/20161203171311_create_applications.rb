class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.string :name
      t.string :description
      t.string :color
      t.string :defaultStatus

      t.timestamps null: false
    end
  end
end
