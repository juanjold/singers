require 'test_helper'

class SingersControllerTest < ActionController::TestCase
  setup do
    @singer = singers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:singers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create singer" do
    assert_difference('Singer.count') do
      post :create, singer: { bio: @singer.bio, email: @singer.email, id: @singer.id, lastname: @singer.lastname, name: @singer.name, number: @singer.number, points: @singer.points, skills: @singer.skills, voicepart: @singer.voicepart, year: @singer.year }
    end

    assert_redirected_to singer_path(assigns(:singer))
  end

  test "should show singer" do
    get :show, id: @singer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @singer
    assert_response :success
  end

  test "should update singer" do
    put :update, id: @singer, singer: { bio: @singer.bio, email: @singer.email, id: @singer.id, lastname: @singer.lastname, name: @singer.name, number: @singer.number, points: @singer.points, skills: @singer.skills, voicepart: @singer.voicepart, year: @singer.year }
    assert_redirected_to singer_path(assigns(:singer))
  end

  test "should destroy singer" do
    assert_difference('Singer.count', -1) do
      delete :destroy, id: @singer
    end

    assert_redirected_to singers_path
  end
end
