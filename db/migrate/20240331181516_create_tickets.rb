class CreateTickets < ActiveRecord::Migration[7.1]
  def change
    create_table :tickets do |t|
      t.references :event, null: false, foreign_key: true
      t.decimal :price
      t.string :status

      t.timestamps
    end
  end
end
