require 'test_helper'

class CompanyNamesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get company_names_new_url
    assert_response :success
  end

  test "should get index" do
    get company_names_index_url
    assert_response :success
  end

end
