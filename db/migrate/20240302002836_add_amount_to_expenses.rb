class AddAmountToExpenses < ActiveRecord::Migration[7.1]
  def change
    add_column :expenses, :amount_in_pennies, :integer
  end
end
