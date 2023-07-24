class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.references :organization, null: false, foreign_key: true
      t.string :stripe_customer_id, null: false, index: { unique: true }

      t.timestamps
    end
  end
end
