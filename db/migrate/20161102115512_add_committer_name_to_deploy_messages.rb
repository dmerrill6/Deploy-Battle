class AddCommitterNameToDeployMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :deploy_messages, :committer_name, :string
  end
end
