class CreateSubscriptions < ActiveRecord::Migration[7.0]
  def change
    create_enum :subscription_status, ["active", "canceled", "past_due", "pending", "trialing"]

    create_table :subscriptions do |t|
      t.references :account, null: false, foreign_key: true
      t.string :stripe_subscription_id
      t.enum :status, enum_type: :subscription_status, null: false, default: "pending"
      t.datetime :current_period_start_at
      t.datetime :current_period_end_at

      t.timestamps
    end

    add_index :subscriptions, [:account_id, :stripe_subscription_id], unique: true
  end
end
