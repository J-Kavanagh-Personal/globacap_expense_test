# frozen_string_literal: true

class UserComponent < ReactComponent
  def initialize(raw_props)
    super("UserComponent", raw_props: raw_props)
  end
end