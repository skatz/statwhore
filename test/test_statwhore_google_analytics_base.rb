require File.dirname(__FILE__) + '/test_helper.rb'

class TestStatewhoreGoogleAnalyticsBase < Test::Unit::TestCase
  test 'should be able to establish connection' do
    assert Statwhore::Google::Analytics::Base.connection_established?
  end
  
  %w(connection_options cookies request parse parse_xml).each do |m|
    test "should have #{m} method" do
      assert Statwhore::Google::Analytics::Base.methods.include?(m)
    end
  end
end