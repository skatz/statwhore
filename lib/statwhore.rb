$:.unshift File.dirname(__FILE__)

require 'net/http'
require 'net/https'
require 'uri'
require 'ostruct'
require 'rubygems'
gem 'hpricot', '>= 0.6'
require 'hpricot'
gem 'activesupport', '>= 2.0.2'
require 'activesupport'
gem 'googlebase', '>= 0.2.0'
require 'google/base'

require File.dirname(__FILE__) + '/statwhore/google'
require File.dirname(__FILE__) + '/statwhore/connection'