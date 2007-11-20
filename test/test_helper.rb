require 'test/unit'
require File.dirname(__FILE__) + '/../lib/statwhore'

class << Test::Unit::TestCase
  def test(name, &block)
    test_name = :"test_#{name.gsub(' ','_')}"
    raise ArgumentError, "#{test_name} is already defined" if self.instance_methods.include? test_name.to_s
    define_method test_name, &block
  end
end

CONFIG = YAML::load(open("#{ENV['HOME']}/.statwhore"))
Statwhore::Google::Analytics::Base.establish_connection(CONFIG[:username], CONFIG[:password])