require 'rails_helper'

RSpec.describe GoalsController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  let(:goal) { FactoryBot.create(:goal, user_id: user.id) }

  describe "GET #show" do


    it "renders the show page" do
      # user = User.create(username: "user", password: "password")
      # goal = Goal.new(title: "Hi", private?: false, completed?: false)
      get :show, params: { id: goal.id }
      expect(response).to render_template(:show)
    end
  end

  describe "GET #new" do
    it "renders the new page" do
      get :new, params: { user_id: goal.user_id }
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "redirects to the goal show page" do
        post :create, params: { goal: {title: "title", user_id: user.id} }
        expect(response).to redirect_to(goal_url(Goal.find_by(title: "title", user_id: user.id)))
      end
    end

    context "with invalid params" do
      it "renders the goal new page" do
        post :create, params: { goal: {title: "", user_id: user.id} }
        expect(response).to render_template(:new)
        expect(flash[:errors]).to be_present
      end
    end
  end

  describe "GET #edit" do
    it "renders the edit page" do
      get :edit, params: { id: goal.id }
      expect(response).to render_template(:edit)
    end
  end

  describe "PATCH #update" do
    context "with valid params" do
      it "redirects to the goal show page" do
        patch :update, params: { id: goal.id , goal: { title: "title2", user_id: user.id } }
        expect(response).to redirect_to(goal_url(Goal.find_by(title: "title2", user_id: user.id)))
      end
    end

    context "with invalid params" do
      it "redirects to the goal edit page" do
        patch :update, params: { id: goal.id, goal: { title: "", user_id: user.id } }
        expect(response).to render_template :edit
        expect(flash[:errors]).to be_present
      end
    end
  end

  describe "DELETE #destroy" do
    it "redirects to the user show page" do
      delete :destroy, params: { id: goal.id }
      expect(Goal.find_by(id: goal.id)).to be_nil
      expect(response).to redirect_to(user_url(goal.user))
    end
  end

end
