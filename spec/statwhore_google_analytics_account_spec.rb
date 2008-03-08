require File.dirname(__FILE__) + '/spec_helper.rb'

describe "Statwhore::Google::Analytics::Account" do
  
  describe "being initialized" do
    
    it "should accept :name as key" do
      a = Statwhore::Google::Analytics::Account.new(:name => 'test')
      a.name.should == 'test'
    end
    
    it "should accept :account_id as key" do
      a = Statwhore::Google::Analytics::Account.new(:account_id => '12341234')
      a.account_id.should == '12341234'
    end
    
  end
  
  it "should be able to find all accounts for user" do
    html = open(File.dirname(__FILE__) + '/fixtures/analytics_account_find_all.html').read
    Statwhore::Google::Analytics::Account.should_receive(:get).and_return(html)
    accounts = Statwhore::Google::Analytics::Account.find_all
    accounts.collect(&:name).should == %w[alumni.nd.edu webgroup.nd.edu]
    accounts.collect(&:account_id).should == %w[1254221 344381].map(&:to_i)
  end
  
  it "should be able to find profiles for an account" do
    html = open(File.dirname(__FILE__) + '/fixtures/analytics_profile_find_all.html').read
    Statwhore::Google::Analytics::Profile.should_receive(:get).and_return(html)
    accounts = Statwhore::Google::Analytics::Account.new(:name => 'alumni.nd.edu', :account_id => '1254221').profiles
    accounts.collect(&:name).should ==  ["pray.nd.edu"]
  end
  
  it "should print kind of pretty" do
    account = Statwhore::Google::Analytics::Account.new(:name => 'alumni.nd.edu', :account_id => '1254221')
    account.to_s.should == "alumni.nd.edu (1254221)"
  end
  
end