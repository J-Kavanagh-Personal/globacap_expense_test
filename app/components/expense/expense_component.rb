# frozen_string_literal: true

class ExpenseComponent < ReactComponent
  def initialize(raw_props)
    super("ExpenseComponent", raw_props: raw_props)
  end

  def props
    raw_props.merge(
      amount: helpers.number_to_currency(raw_props[:amount], unit: "£")
    )
  end
end