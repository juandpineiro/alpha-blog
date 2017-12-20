require 'test_helper'

class UserSignupTest < ActionDispatch::IntegrationTest
  
  test 'get signup form and create user' do
    get signup_path
    assert_template 'users/new'
    assert_difference 'User.count' do
      post users_path, user: {username: 'johndoe', email: 'jdoe@example.com', password: 'foobar'}
      follow_redirect!
    end
    # assert_template "user/#{current_user.id}"
    assert_match 'johndoe', response.body
  end

  test 'invalid user submission results in failure' do
    get signup_path
    assert_template 'users/new'
    assert_no_difference 'User.count' do
      post users_path, user: { username: ' ', email: ' ', password: ' '}
    end
    assert_template 'users/new'
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'
  end

end