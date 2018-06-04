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

    it "return list of all schools" do
      get api_v1_schools_path, nil, {'HTTP_AUTHORIZATION' => 'TEST_VALID_TOKEN'}

      assert_equal "Lycée René Cassin", json_response['schools'][0]['name']
      assert_equal "Ynov Ingésup Informatique", json_response['schools'][1]['name']
      assert_equal 2, json_response['count']
      assert_equal 200, last_response.status
    end

    it "return list of public schools" do
      get api_v1_schools_path, {status: 'public'}, {'HTTP_AUTHORIZATION' => 'TEST_VALID_TOKEN'}

      assert_equal "public", json_response['schools'][0]['status']
      assert_equal 1, json_response['count']
      assert_equal 200, last_response.status
    end

    it "return list of private schools" do
      get api_v1_schools_path, {status: 'private'}, {'HTTP_AUTHORIZATION' => 'TEST_VALID_TOKEN'}

      assert_equal "private", json_response['schools'][0]['status']
      assert_equal 1, json_response['count']
      assert_equal 200, last_response.status
    end
  end

  describe "#delete" do
    it "delete valid school" do
      delete api_v1_school_path(1), nil, {'HTTP_AUTHORIZATION' => 'TEST_VALID_TOKEN'}
      assert_equal true, json_response['success']
      assert_equal 200, last_response.status
    end
  end

  describe "#create" do
    it "return 201 when school is successfull created" do
      assert_difference "School.all.count" do
        post api_v1_schools_path, {school: {name: "Collège George Sand"}}, {'HTTP_AUTHORIZATION' => 'TEST_VALID_TOKEN'}

        assert_equal 201, last_response.status
        assert_equal 'Collège George Sand', json_response['school']['name']
      end
    end

    it "return 400 when school is unsuccessfulll created" do
      post api_v1_schools_path, {school: {opening_hours: "5h-14h"}}, {'HTTP_AUTHORIZATION' => 'TEST_VALID_TOKEN'}

      assert_equal 400, last_response.status
    end
  end

  describe "#update" do
    it "return 200 when school is successfulllt updated" do
      patch api_v1_school_path(2), {school: {opening_hours: "7h-19h"}}, {'HTTP_AUTHORIZATION' => 'TEST_VALID_TOKEN'}

      assert_equal 200, last_response.status
      assert_equal '7h-19h', json_response['school']['opening_hours']
    end
  end

end
