require 'test_helper'

class UsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @u = us(:one)
  end

  test "should get index" do
    get us_url
    assert_response :success
  end

  test "should get new" do
    get new_u_url
    assert_response :success
  end

  test "should create u" do
    assert_difference('U.count') do
      post us_url, params: { u: { age: @u.age, birthday: @u.birthday, gender: @u.gender, hometown: @u.hometown, name: @u.name, remarks: @u.remarks } }
    end

    assert_redirected_to u_url(U.last)
  end

  test "should show u" do
    get u_url(@u)
    assert_response :success
  end

  test "should get edit" do
    get edit_u_url(@u)
    assert_response :success
  end

  test "should update u" do
    patch u_url(@u), params: { u: { age: @u.age, birthday: @u.birthday, gender: @u.gender, hometown: @u.hometown, name: @u.name, remarks: @u.remarks } }
    assert_redirected_to u_url(@u)
  end

  test "should destroy u" do
    assert_difference('U.count', -1) do
      delete u_url(@u)
    end

    assert_redirected_to us_url
  end
end
