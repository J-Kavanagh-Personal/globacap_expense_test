%w[Adam Steven Michael Kevin].each do |user|
  User.find_or_create_by!(name: user)
end

[200, 300, 400].each do |amount|
  Expense.find_or_create_by!(user_id: 1, amount_in_pennies: amount)
  Expense.find_or_create_by!(user_id: 2, amount_in_pennies: amount)
  Expense.find_or_create_by!(user_id: 3, amount_in_pennies: amount)
end

[500, 600, 700].each do |amount|
  Expense.find_or_create_by!(user_id: 2, amount_in_pennies: amount)
  Expense.find_or_create_by!(user_id: 3, amount_in_pennies: amount)
  Expense.find_or_create_by!(user_id: 4, amount_in_pennies: amount)
end

[800, 900, 1000].each do |amount|
  Expense.find_or_create_by!(user_id: 3, amount_in_pennies: amount)
  Expense.find_or_create_by!(user_id: 4, amount_in_pennies: amount)
end