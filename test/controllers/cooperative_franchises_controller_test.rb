require "test_helper"

class CooperativeFranchisesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cooperative_franchise = cooperative_franchises(:one)
  end

  test "should get index" do
    get cooperative_franchises_url
    assert_response :success
  end

  test "should get new" do
    get new_cooperative_franchise_url
    assert_response :success
  end

  test "should create cooperative_franchise" do
    assert_difference("CooperativeFranchise.count") do
      post cooperative_franchises_url, params: { cooperative_franchise: { cooperative_id: @cooperative_franchise.cooperative_id, creator_id: @cooperative_franchise.creator_id, creator_type: @cooperative_franchise.creator_type, expiry: @cooperative_franchise.expiry, franchisee_id: @cooperative_franchise.franchisee_id, franchisee_type: @cooperative_franchise.franchisee_type, product_id: @cooperative_franchise.product_id, status: @cooperative_franchise.status } }
    end

    assert_redirected_to cooperative_franchise_url(CooperativeFranchise.last)
  end

  test "should show cooperative_franchise" do
    get cooperative_franchise_url(@cooperative_franchise)
    assert_response :success
  end

  test "should get edit" do
    get edit_cooperative_franchise_url(@cooperative_franchise)
    assert_response :success
  end

  test "should update cooperative_franchise" do
    patch cooperative_franchise_url(@cooperative_franchise), params: { cooperative_franchise: { cooperative_id: @cooperative_franchise.cooperative_id, creator_id: @cooperative_franchise.creator_id, creator_type: @cooperative_franchise.creator_type, expiry: @cooperative_franchise.expiry, franchisee_id: @cooperative_franchise.franchisee_id, franchisee_type: @cooperative_franchise.franchisee_type, product_id: @cooperative_franchise.product_id, status: @cooperative_franchise.status } }
    assert_redirected_to cooperative_franchise_url(@cooperative_franchise)
  end

  test "should destroy cooperative_franchise" do
    assert_difference("CooperativeFranchise.count", -1) do
      delete cooperative_franchise_url(@cooperative_franchise)
    end

    assert_redirected_to cooperative_franchises_url
  end
end
