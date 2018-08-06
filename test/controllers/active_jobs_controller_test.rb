require 'test_helper'

class ActiveJobsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get active_jobs_index_url
    assert_response :success
  end

end
