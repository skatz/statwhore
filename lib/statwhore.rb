$:.unshift File.dirname(__FILE__)

require 'net/http'
require 'net/https'
require 'uri'
require 'ostruct'
require 'rubygems'
require 'hpricot'
require 'active_support'

gem 'googlebase', '>= 0.2.0'
require 'google/base'

require File.dirname(__FILE__) + '/statwhore/google'
require File.dirname(__FILE__) + '/statwhore/connection'