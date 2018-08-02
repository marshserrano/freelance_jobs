require 'test_helper'

class ReviewControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get review_new_url
    assert_response :success
  end

end
