class CreateOrganizations < ActiveRecord::Migration[7.0]
  def change
    create_table :organizations do |t|
      t.string :name, null: false, index: { unique: true }

      t.timestamps
    end

    add_reference :users, :organization, foreign_key: true
  end
end
