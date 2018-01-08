require 'rails_helper'

RSpec.describe User, type: :model do

  describe "validations" do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_presence_of(:session_token) }
    it { should validate_length_of(:password).is_at_least(6) }
  end

  describe "associations" do
    it { should have_many(:goals) }
  end

  describe "class methods" do
    describe "::find_by_credentials" do
      # let(:invaliduser) { FactoryBot.create(username: 'user', password: '') }
      let(:user) { FactoryBot.create(:user) }

      it "finds the correct user with valid credentials" do
        expect(User.find_by_credentials(user.username, user.password)).to eq(user)
      end

      it "returns nil if credentials are invalid" do
        expect(User.find_by_credentials(user.username, 'invalid')).to eq(nil)
      end

    end
  end

end
