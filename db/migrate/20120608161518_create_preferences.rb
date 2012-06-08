class CreatePreferences < ActiveRecord::Migration
  def change
    create_table :preferences do |t|
      t.references :preferrer, :polymorphic => true
      t.string :key
      t.string :value

      t.timestamps
    end
    add_index :preferences, :preferrer_id
  end
end
