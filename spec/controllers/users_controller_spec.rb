require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #show" do
    let(:user) { FactoryBot.create(:user) }
    it "renders the show template" do
      get :show, id: user.id
      expect(response).to have_http_status(200)
      expect(response).to render_template(:show)
    end
  end

  describe "GET #new" do
    it "renders the new template" do
      get :new
      expect(response).to have_http_status(200)
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "redirects to the user page" do
        post :create, user: { username: "user", password: "password"}
        expect(response).to redirect_to user_url(User.find_by(username: "user"))
      end
    end

    context "with invalid params" do
      it "renders the new template" do
        post :create, user: { username: "user", password:"" }
        expect(response).to render_template(:new)
      end
    end
  end

end
