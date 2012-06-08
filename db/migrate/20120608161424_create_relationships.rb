class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.references :sender, :polymorphic => true
      t.references :receiver, :polymorphic => true
      t.string :status

      t.timestamps
    end
    add_index :relationships, :sender_id
    add_index :relationships, :receiver_id
  end
end
