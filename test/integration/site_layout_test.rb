require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  def setup
    @admin     = users(:michael)
    @non_admin = users(:archer)
  end
  
  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
    assert_select "a[href=?]", signup_path
    log_in_as(@admin)
    get users_path
    assert_template 'users/index'
    assert_select "a[href=?]", login_path, count: 0 # "Login" link won't be present
    assert_select "a[href=?]", logout_path # "Logout" link will be present
    assert_select "a[href=?]", users_path # "Users" link will be present
    assert_select 'a[href=?]', '#', text: 'Account' # "Account" link will be present
  end
end