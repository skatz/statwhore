require File.dirname(__FILE__) + '/../lib/statwhore'
require 'ostruct'
require 'yaml'

include Statwhore::Google::Analytics

logger = Logger.new('../log/debug.log')
config = YAML::load(open(ENV["HOME"] + '/.statwhore'))
Google::Base.establish_connection(config[:username], config[:password])

class Site < OpenStruct; end

live = [
  Site.new(:account => 344381, :profile => 3939049, :name => 'ace'),
  Site.new(:account => 344381, :profile => 4804412, :name => 'admissions'),
  Site.new(:account => 344381, :profile => 6345870, :name => 'building_communities'),
  Site.new(:account => 344381, :profile => 8071820, :name => 'campus_ministry'),
  Site.new(:account => 344381, :profile => 4505702, :name => 'career'),
  Site.new(:account => 344381, :profile => 5190819, :name => 'committees'),
  Site.new(:account => 344381, :profile => 3090719, :name => 'conductor'),
  Site.new(:account => 344381, :profile => 4900769, :name => 'enlighten'),
  Site.new(:account => 344381, :profile => 5190683, :name => 'green'),
  Site.new(:account => 344381, :profile => 5309061, :name => 'issa'),
  Site.new(:account => 344381, :profile => 1027308, :name => 'law'),
  Site.new(:account => 344381, :profile => 8220615, :name => 'old2gold'),
  Site.new(:account => 1254221, :profile => 2420755, :name => 'pray'),
  Site.new(:account => 344381, :profile => 6085464, :name => 'summer_scholars'),
  Site.new(:account => 344381, :profile => 4263845, :name => 'vocation'),
  Site.new(:account => 344381, :profile => 543890, :name => 'webgroup')
]

# dates = {:from => Time.mktime(2007, 10, 1), :to  => Time.now}
# dates = {:from => Time.mktime(2008, 1, 1), :to  => Time.now}
dates = {:from => Time.mktime(2008, 4, 1), :to  => Time.now}
puts live.inject(0) { |total, site| 
  views = Profile.find(site.account, site.profile).pageviews(dates)
  puts "#{views} - #{site.name}"
  total += views
  total 
}