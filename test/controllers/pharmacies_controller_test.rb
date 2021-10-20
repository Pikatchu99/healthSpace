require 'test_helper'

class PharmaciesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pharmacy = pharmacies(:one)
  end

  test "should get index" do
    get pharmacies_url
    assert_response :success
  end

  test "should get new" do
    get new_pharmacy_url
    assert_response :success
  end

  test "should create pharmacy" do
    assert_difference('Pharmacy.count') do
      post pharmacies_url, params: { pharmacy: { contact: @pharmacy.contact, email: @pharmacy.email, name: @pharmacy.name, whatsapp: @pharmacy.whatsapp } }
    end

    assert_redirected_to pharmacy_url(Pharmacy.last)
  end

  test "should show pharmacy" do
    get pharmacy_url(@pharmacy)
    assert_response :success
  end

  test "should get edit" do
    get edit_pharmacy_url(@pharmacy)
    assert_response :success
  end

  test "should update pharmacy" do
    patch pharmacy_url(@pharmacy), params: { pharmacy: { contact: @pharmacy.contact, email: @pharmacy.email, name: @pharmacy.name, whatsapp: @pharmacy.whatsapp } }
    assert_redirected_to pharmacy_url(@pharmacy)
  end

  test "should destroy pharmacy" do
    assert_difference('Pharmacy.count', -1) do
      delete pharmacy_url(@pharmacy)
    end

    assert_redirected_to pharmacies_url
  end
end
