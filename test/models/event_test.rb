require "test_helper"

class EventTest < ActiveSupport::TestCase
  setup do
    @event = Event.new
  end

  test "should not save an event without data" do
    assert_not @event.valid?
  end
end
