require File.dirname(__FILE__) + '/../lib/statwhore'
require 'ostruct'
require 'yaml'

config = YAML::load(open(ENV["HOME"] + '/.statwhore'))
Google::Base.establish_connection(config[:username], config[:password])
include Statwhore::Google::Analytics

dates = {:from => Time.mktime(2008, 1, 1), :to  => Time.now}
profile = Profile.find(config[:account], config[:profile])
pp profile.pageviews(dates)
pp profile.visits(dates)