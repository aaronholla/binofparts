require 'test_helper'

class MyteamsControllerTest < ActionController::TestCase
  setup do
    @myteam = myteams(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:myteams)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create myteam" do
    assert_difference('Myteam.count') do
      post :create, myteam: {  }
    end

    assert_redirected_to myteam_path(assigns(:myteam))
  end

  test "should show myteam" do
    get :show, id: @myteam
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @myteam
    assert_response :success
  end

  test "should update myteam" do
    patch :update, id: @myteam, myteam: {  }
    assert_redirected_to myteam_path(assigns(:myteam))
  end

  test "should destroy myteam" do
    assert_difference('Myteam.count', -1) do
      delete :destroy, id: @myteam
    end

    assert_redirected_to myteams_path
  end
end
