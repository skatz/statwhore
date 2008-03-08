require File.dirname(__FILE__) + '/spec_helper.rb'

describe "Statwhore::Google::Analytics::Profile" do
  
  describe "being initialized" do
    
    it "should accept :name as key" do
      a = Statwhore::Google::Analytics::Profile.new(:name => 'test', :profile_id => '12341234')
      a.name.should == 'test'
    end
    
    it "should accept :account_id as key" do
      a = Statwhore::Google::Analytics::Profile.new(:account_id => '12341234', :profile_id => '12341234')
      a.account_id.should == '12341234'
    end
    
    it "should accept :profile_id as key" do
      a = Statwhore::Google::Analytics::Profile.new(:profile_id => '12341234')
      a.profile_id.should == '12341234'
    end
    
  end
  
  it "should be able to find all profiles for an account" do
    html = open(File.dirname(__FILE__) + '/fixtures/analytics_profile_find_all.html').read
    Statwhore::Google::Analytics::Profile.should_receive(:get).and_return(html)
    accounts = Statwhore::Google::Analytics::Profile.find_all('1254221')
    accounts.collect(&:name).should ==  ["pray.nd.edu"]
  end
  
  it "should be able to get pageviews" do
    profile = Statwhore::Google::Analytics::Profile.new(:account_id => 344381, :profile_id => 543890)
    xml = open(File.dirname(__FILE__) + '/fixtures/dashboard_report_webgroup.xml').read
    Statwhore::Google::Analytics::Profile.should_receive(:get).and_return(xml)
    profile.pageviews.should == 283
  end
  
  it "should be able to get visits" do
    profile = Statwhore::Google::Analytics::Profile.new(:account_id => 344381, :profile_id => 543890)
    xml = open(File.dirname(__FILE__) + '/fixtures/dashboard_report_webgroup.xml').read
    Statwhore::Google::Analytics::Profile.should_receive(:get).and_return(xml)
    profile.visits.should == 228
  end
  
end