class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.references :buyer, :polymorphic => true
      t.references :purchasable, :polymorphic => true
      t.date :purchase_date
      t.date :real_travel_date
      t.float :amount
      t.integer :length_of_stay

      t.timestamps
    end
    add_index :purchases, :buyer_id
    add_index :purchases, :purchasable_id
  end
end
