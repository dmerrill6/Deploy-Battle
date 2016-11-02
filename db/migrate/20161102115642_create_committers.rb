class CreateCommitters < ActiveRecord::Migration[5.0]
  def change
    create_table :committers do |t|
      t.string :name
      t.integer :push_number, default: 0
      t.integer :success_number, default: 0
      t.integer :failure_number, default: 0
      t.integer :project_id

      t.timestamps
    end
  end
end
