require 'test_helper'

feature "Schools" do
  describe "#index" do
    it "return 401 when HTTP_AUTHORIZATION is invalid" do
      get api_v1_schools_path, nil, {'HTTP_AUTHORIZATION' => 'INVALID_TOKEN'}

      assert_equal 401, last_response.status
    end

    it "return 401 when HTTP_AUTHORIZATION is unknown" do
      get api_v1_schools_path

      assert_equal 401, last_response.status
    end

    it "return 200 when HTTP_AUTHORIZATION is valid" do
      get api_v1_schools_path, nil, {'HTTP_AUTHORIZATION' => 'TEST_VALID_TOKEN'}

      assert_equal 200, last_response.status
    end
  end
end
