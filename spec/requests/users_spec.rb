# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/users', type: :request do
  let(:user) { create(:user) }

  it "get /users" do
    get "/users"
    expect(response).to have_http_status(:ok)
    expect(response).to render_template(:index)
  end

  it "get /users/?" do
    get "/users/#{user.id}"
    expect(response).to have_http_status(:ok)
    expect(response).to render_template(:show)
  end

  it "get /users/new" do
    get "/users/new"
    expect(response).to have_http_status(:ok)
    expect(response).to render_template(:new)
  end

  it "get /users/?/edit" do
    get "/users/#{user.id}/edit"
    expect(response).to have_http_status(:ok)
    expect(response).to render_template(:edit)
  end

  it "post /users" do
    post users_url, params: { user: { name:'Testing McTestFace' } }
    expect(response).to have_http_status(:found)
    expect(response).to redirect_to(user_url(User.last))
  end

  it "put /users/?" do
    put "/users/#{user.id}", params: { user: { name:'Testing McTestFace 2' } }
    expect(response).to have_http_status(:found)
    expect(response).to redirect_to(user_url(user))
    expect(user.reload.name).to eq('Testing McTestFace 2')
  end

  it "DELETE /users/?" do
    delete "/users/#{user.id}"
    expect(response).to have_http_status(:found)
    expect(response).to redirect_to(users_url)
  end
end
