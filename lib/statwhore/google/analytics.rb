require File.dirname(__FILE__) + '/analytics/account'
require File.dirname(__FILE__) + '/analytics/profile'

module Statwhore
  module Google
    module Analytics
      FORMAT_PDF = '0'
      FORMAT_XML = '1'
      FORMAT_CSV = '2'
      FORMAT_TAB = '3'
            
      VALID_REPORTS = %w[ Dashboard ]
         
      class InvalidCredentials < Exception; end
    end
  end
end