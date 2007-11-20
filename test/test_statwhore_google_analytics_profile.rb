require File.dirname(__FILE__) + '/test_helper.rb'

class TestStatewhoreGoogleAnalyticsProfile < Test::Unit::TestCase
  
  def setup
    @profile = Statwhore::Google::Analytics::Profile.new(:profile_id => 1)
  end
  
  test 'should be able to find all profiles for account' do
    assert Statwhore::Google::Analytics::Profile.find_all(344381).size > 0
  end
  
  test 'should be able to find individual profile' do
    assert_equal 'webgroup.nd.edu', Statwhore::Google::Analytics::Profile.find(344381, 543890).name
  end
  
  test 'should require profile id to initialize' do
    assert_raises(ArgumentError) { Statwhore::Google::Analytics::Profile.new }
  end
  
  test 'should be able to ensure a date is in google format when given time object' do
    assert_equal '20071017', @profile.ensure_datetime_in_google_format(Time.parse('2007-10-17'))
  end
  
  test 'should be able to ensure a date is in google format when given date object' do
    assert_equal '20071017', @profile.ensure_datetime_in_google_format(Date.parse('2007-10-17'))
  end
  
  test 'should be able to ensure a date is in google format when given a correctly formatted string object' do
    assert_equal '20071017', @profile.ensure_datetime_in_google_format('20071017')
  end
  
  test 'should be able to get reports' do
    flunk
  end
  
  test 'should be able to get summaries' do
    flunk
  end
end