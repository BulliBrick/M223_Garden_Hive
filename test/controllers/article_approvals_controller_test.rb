require "test_helper"

class ArticleApprovalsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get article_approvals_create_url
    assert_response :success
  end

  test "should get update" do
    get article_approvals_update_url
    assert_response :success
  end
end
