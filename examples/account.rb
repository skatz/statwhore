require File.dirname(__FILE__) + '/../lib/statwhore'
require 'pp'

config = YAML::load(open(ENV["HOME"] + '/.statwhore'))
Google::Base.establish_connection(config[:username], config[:password])
include Statwhore::Google::Analytics

pp Account.find_all