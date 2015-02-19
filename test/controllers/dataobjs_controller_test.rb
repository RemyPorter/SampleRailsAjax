require 'test_helper'

class DataobjsControllerTest < ActionController::TestCase
  setup do
    @dataobj = dataobjs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dataobjs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dataobj" do
    assert_difference('Dataobj.count') do
      post :create, dataobj: { description: @dataobj.description, name: @dataobj.name }
    end

    assert_redirected_to dataobj_path(assigns(:dataobj))
  end

  test "should show dataobj" do
    get :show, id: @dataobj
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dataobj
    assert_response :success
  end

  test "should update dataobj" do
    patch :update, id: @dataobj, dataobj: { description: @dataobj.description, name: @dataobj.name }
    assert_redirected_to dataobj_path(assigns(:dataobj))
  end

  test "should destroy dataobj" do
    assert_difference('Dataobj.count', -1) do
      delete :destroy, id: @dataobj
    end

    assert_redirected_to dataobjs_path
  end
end
