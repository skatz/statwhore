require File.dirname(__FILE__) + '/test_helper.rb'

class TestStatewhoreGoogleAnalyticsAccount < Test::Unit::TestCase  
  test 'should be able to find accounts' do
    assert Statwhore::Google::Analytics::Account.find_all().any? { |a| a.name == 'webgroup.nd.edu' }
  end
  
  test 'should be able to find profiles for account' do
    assert Statwhore::Google::Analytics::Account.new(:account_id => 344381, :name => 'webgroup.nd.edu').profiles.size > 0
  end
end