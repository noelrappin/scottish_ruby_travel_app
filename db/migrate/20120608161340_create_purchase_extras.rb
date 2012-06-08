class CreatePurchaseExtras < ActiveRecord::Migration
  def change
    create_table :purchase_extras do |t|
      t.references :extra, :polymorphic => true
      t.references :purchase
      t.integer :unit_count
      t.float :unit_price

      t.timestamps
    end
    add_index :purchase_extras, :purchase_id
  end
end
