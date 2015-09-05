class CreateEmailAddresses < ActiveRecord::Migration
  def change
    create_table :email_addresses do |t|
      t.string :address
      t.references :person, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
