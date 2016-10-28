class CreateDeployMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :deploy_messages do |t|
      t.string :message_type
      t.integer :project_id

      t.timestamps
    end
  end
end
