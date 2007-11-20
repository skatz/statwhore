$:.unshift File.dirname(__FILE__)

require 'net/http'
require 'net/https'
require 'uri'
require 'ostruct'
require 'rubygems'
require 'hpricot'
require 'active_support'

require 'statwhore/google'