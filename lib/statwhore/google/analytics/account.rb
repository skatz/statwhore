module Statwhore
  module Google
    module Analytics      
      class Account < Base
        class << self
          def find_all
            doc = parse(request('/analytics/home/'))
            (doc/'select[@name=account_list] option').inject([]) do |accounts, option|
              account_id = option['value'].to_i
              accounts << new(:account_id => account_id, :name => option.inner_html) if account_id > 0
              accounts
            end
          end
        end
        
        attr_accessor :name, :account_id
        
        def initialize(attrs)
          @name = attrs[:name]
          @account_id = attrs[:account_id]
        end
        
        def profiles(force=false)
          if force || @profiles.nil?
            @profiles = Profile.find_all(account_id)
          end
          @profiles
        end

        def to_s
          "#{name} (#{account_id})"
        end
      end
    end
  end
end