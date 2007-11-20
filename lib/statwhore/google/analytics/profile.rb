module Statwhore
  module Google
    module Analytics      
      class Profile < Base
        class << self
          def find_all(account_id)
            doc = parse(request("/analytics/home/admin?scid=#{account_id}"))
            (doc/'select[@name=profile_list] option').inject([]) do |profiles, option|
              profile_id = option['value'].to_i
              profiles << Profile.new(:account_id => account_id, :profile_id => profile_id, :name => option.inner_html) if profile_id > 0
              profiles
            end
          end
          
          def find(account_id, profile_id)
            find_all(account_id).select { |p| p.profile_id.to_s == profile_id.to_s }.first
          end
        end
        
        attr_accessor :account_id, :name, :profile_id
        
        def initialize(attrs)
          raise ArgumentError, ":profile_id is required" unless attrs.has_key?(:profile_id)
          @account_id = attrs[:account_id]  if attrs.has_key?(:account_id)
          @name       = attrs[:name]        if attrs.has_key?(:name)
          @profile_id = attrs[:profile_id]  if attrs.has_key?(:profile_id)
        end
        
        def summaries(options={})
          doc = Hpricot.XML(get_report(options))
          (doc/:ItemSummary).inject([]) do |sums, is|
            sums << OpenStruct.new(
              :id    => is['id'], 
              :name  => is.at('Message').inner_html, 
              :value => is.at('SummaryValue').inner_html
            ) 
            sums
          end
        end
        
        # start/stop: Ymd format
        def get_report(options={})
          options.reverse_merge!({
            :report      => 'DashboardReport',
            :format      => FORMAT_XML,
            :start       => Time.now.utc - 7.days,
            :stop        => Time.now.utc,
            :filter      => nil,
            :filter_mode => FILTER_MATCH,
            :sort_column => 2,
            :sort_order  => SORT_DESC
          })
          
          options[:start] = ensure_datetime_in_google_format(options[:start])
          options[:stop]  = ensure_datetime_in_google_format(options[:stop])
          
          params = {
            'id'  => profile_id,
            'rpt' => options[:report],
            'fmt' => options[:format],
            'pdr' => "#{options[:start]}-#{options[:stop]}",
            'cmp' => 'average',
            'fd' => options[:filter],
            'ft' => options[:filter_mode],
            'sf' => options[:sort_column],
            'sb' => options[:sort_order]
          }
          
          qs = params.inject('') { |str, h| str << "#{h[0]}=#{h[1]}&" }
          self.class.request("/analytics/reporting/export?#{qs}")
        end

        # takes a Date, Time or String
        def ensure_datetime_in_google_format(time)
          time.is_a?(Time) || time.is_a?(Date) ? time.strftime('%Y%m%d') : time
        end
        
        def to_s
          "#{name} (#{profile_id})"
        end
      end
    end
  end
end