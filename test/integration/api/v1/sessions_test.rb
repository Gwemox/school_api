require 'test_helper'

feature "Authentification" do
  describe "#create" do
    it "logs_in user with valid email+password" do
      user = User.create!(
        email: "user_1@domain.com",
        password: "password123",
        password_confirmation: "password123"
      )

      post api_v1_user_session_path, {
        email: user.email,
        password: user.password
      }

      assert_equal 200, last_response.status
      assert_equal false, json_response['auth_token'].blank?
    end

    it "logs_in user with valid email and invalid password" do
      post api_v1_user_session_path, {
        email: "user_1@domain.com",
        password: "BAD_PASSWORD"
      }

      assert_equal 401, last_response.status
    end

    it "logs_in user with valid password and invalid email" do
      post api_v1_user_session_path, {
        email: "INVALID@domain.com",
        password: "password123"
      }

      assert_equal 401, last_response.status
    end
  end
end
