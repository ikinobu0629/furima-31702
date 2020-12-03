require 'test_helper'

class ItemPurchasesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get item_purchases_index_url
    assert_response :success
  end

end
