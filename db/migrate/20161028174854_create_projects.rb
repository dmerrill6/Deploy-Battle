class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :successful_deploy_url
      t.string :unsuccessful_deploy_url
      t.string :pending_deploy_url
      t.string :name

      t.timestamps
    end
  end
end
