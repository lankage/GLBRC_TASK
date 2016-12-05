class CreateUserSelectedApplications < ActiveRecord::Migration
  def change
    create_table :user_selected_applications do |t|
      t.integer :user_id
      t.integer :application_id
      t.integer :is_selected

      t.timestamps null: false
    end
  end
end
