module Statwhore
  module Google
    module Feedburner
      API_URL = 'http://api.feedburner.com/management/1.0'
      
      class Base
        def self.establish_connection(u, p)
          @@connection = Connection.new(API_URL, u, p)
        end
        
        def self.connection
          @@connection
        end
      end
      
      class Feed < Base
        
      end
      
    end
  end
end
# 
# include Statwhore::Google
# Feedburner::Feed.find(:all)
# Feedburner::Feed.find('johnnunemaker')
# Feedburner::Feed.find(1234)