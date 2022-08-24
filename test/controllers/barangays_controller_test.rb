require "test_helper"

class BarangaysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @barangay = barangays(:one)
  end

  test "should get index" do
    get barangays_url
    assert_response :success
  end

  test "should get new" do
    get new_barangay_url
    assert_response :success
  end

  test "should create barangay" do
    assert_difference("Barangay.count") do
      post barangays_url, params: { barangay: { municipality_id: @barangay.municipality_id, name: @barangay.name, province_id: @barangay.province_id, psgc_code: @barangay.psgc_code, region_id: @barangay.region_id } }
    end

    assert_redirected_to barangay_url(Barangay.last)
  end

  test "should show barangay" do
    get barangay_url(@barangay)
    assert_response :success
  end

  test "should get edit" do
    get edit_barangay_url(@barangay)
    assert_response :success
  end

  test "should update barangay" do
    patch barangay_url(@barangay), params: { barangay: { municipality_id: @barangay.municipality_id, name: @barangay.name, province_id: @barangay.province_id, psgc_code: @barangay.psgc_code, region_id: @barangay.region_id } }
    assert_redirected_to barangay_url(@barangay)
  end

  test "should destroy barangay" do
    assert_difference("Barangay.count", -1) do
      delete barangay_url(@barangay)
    end

    assert_redirected_to barangays_url
  end
end
