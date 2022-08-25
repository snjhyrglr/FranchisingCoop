require "application_system_test_case"

class CooperativeFranchisesTest < ApplicationSystemTestCase
  setup do
    @cooperative_franchise = cooperative_franchises(:one)
  end

  test "visiting the index" do
    visit cooperative_franchises_url
    assert_selector "h1", text: "Cooperative franchises"
  end

  test "should create cooperative franchise" do
    visit cooperative_franchises_url
    click_on "New cooperative franchise"

    fill_in "Cooperative", with: @cooperative_franchise.cooperative_id
    fill_in "Creator", with: @cooperative_franchise.creator_id
    fill_in "Creator type", with: @cooperative_franchise.creator_type
    fill_in "Expiry", with: @cooperative_franchise.expiry
    fill_in "Franchisee", with: @cooperative_franchise.franchisee_id
    fill_in "Franchisee type", with: @cooperative_franchise.franchisee_type
    fill_in "Product", with: @cooperative_franchise.product_id
    fill_in "Status", with: @cooperative_franchise.status
    click_on "Create Cooperative franchise"

    assert_text "Cooperative franchise was successfully created"
    click_on "Back"
  end

  test "should update Cooperative franchise" do
    visit cooperative_franchise_url(@cooperative_franchise)
    click_on "Edit this cooperative franchise", match: :first

    fill_in "Cooperative", with: @cooperative_franchise.cooperative_id
    fill_in "Creator", with: @cooperative_franchise.creator_id
    fill_in "Creator type", with: @cooperative_franchise.creator_type
    fill_in "Expiry", with: @cooperative_franchise.expiry
    fill_in "Franchisee", with: @cooperative_franchise.franchisee_id
    fill_in "Franchisee type", with: @cooperative_franchise.franchisee_type
    fill_in "Product", with: @cooperative_franchise.product_id
    fill_in "Status", with: @cooperative_franchise.status
    click_on "Update Cooperative franchise"

    assert_text "Cooperative franchise was successfully updated"
    click_on "Back"
  end

  test "should destroy Cooperative franchise" do
    visit cooperative_franchise_url(@cooperative_franchise)
    click_on "Destroy this cooperative franchise", match: :first

    assert_text "Cooperative franchise was successfully destroyed"
  end
end
