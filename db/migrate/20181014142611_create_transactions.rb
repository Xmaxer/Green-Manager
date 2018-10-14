class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.money :credit
      t.money :debit
      t.integer :user_id
      t.integer :category_id
      t.string :source

      t.timestamps
    end
  end
end
