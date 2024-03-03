# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/users/?/expenses', type: :request do
  let(:user) { create(:user) }
  let(:expense) { create(:expense, user: user)}

  it "get /expenses" do
    get "/users/#{user.id}/expenses"
    expect(response).to have_http_status(:ok)
    expect(response).to render_template(:index)
  end

  it "get /users/?/expenses/?" do
    get "/users/#{user.id}/expenses/#{expense.id}"
    expect(response).to have_http_status(:ok)
    expect(response).to render_template(:show)
  end

  it "get /users/?/expenses/new" do
    get "/users/#{user.id}/expenses/new"
    expect(response).to have_http_status(:ok)
    expect(response).to render_template(:new)
  end

  it "get /users/?/expenses/?/edit" do
    get "/users/#{user.id}/expenses/#{expense.id}/edit"
    expect(response).to have_http_status(:ok)
    expect(response).to render_template(:edit)
  end

  it "post /users/?/expenses" do
    post user_expenses_path(user), params: { user_id: user.id, expense: { user_id: user.id, amount_in_pennies: 100 } }
    expect(response).to have_http_status(:found)
    expect(response).to redirect_to(user_expenses_url)
  end

  it "put /users/?/expenses/?" do
    put "/users/#{user.id}/expenses/#{expense.id}", params: { expense: { amount_in_pennies: 100 } }
    expect(response).to have_http_status(:found)
    expect(response).to redirect_to(user_expense_url(expense))

  end

  it "DELETE /users/?/expenses/?" do
    delete "/users/#{user.id}/expenses/#{expense.id}"
    expect(response).to have_http_status(:found)
    expect(response).to redirect_to(user_expenses_url)
  end

  it "GET /users/?/expenses/summary" do
    get "/users/#{user.id}/expenses/summary"
    expect(response).to have_http_status(:ok)
    expect(response).to render_template(:summary)
  end
end
