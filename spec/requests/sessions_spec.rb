require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "POST /sign_in" do

    it "can sign in" do
      post sign_in_path, params: { citizen_id: "1111111111111", password: "11111111" }
      expect(response).to redirect_to(home_path)
      expect(flash[:notice]).to eq("Logged in successfully.")
    end

    it "cannot sign in, invalid citizen id" do
      post sign_in_path, params: { citizen_id: "111111111111", password: "11111111" }
      expect(flash[:alert]).to eq("Invalid Citizen ID or password.")
    end

    it "cannot sign in, invalid password" do
      post sign_in_path, params: { citizen_id: "1111111111111", password: "1111111" }
      expect(flash[:alert]).to eq("Invalid Citizen ID or password.")
    end

  end
end
