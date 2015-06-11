require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  
  
  def setup
    
    @user = users(:test_mike)
    
  end
  
  test 'pevious events should return attended events before current time' do
    assert_equal @user.attended_events, 2
    assert_equal @user.previous_events, 1
  
  end
end
