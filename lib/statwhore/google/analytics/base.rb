module Statwhore
  module Google
    module Analytics      
      class Base
        class << self

          def establish_connection(u, p, o={})
            @@logged_in, @@username, @@password = false, u, p
            
            @@connection_options = {
              :language => LANGUAGE_ENGLISH_US
            }.merge(o)

            params = {
              'continue'         => 'https://www.google.com/analytics/home/?et=reset&hl=' + connection_options[:language],
      	      'service'          => 'analytics',
      	      'nui'              =>	'hidden',
      	      'hl'               => connection_options[:language],
      	      'GA3T'             =>	'ouVrvynQwUs',
      	      'Email'            => @@username,
      	      'Passwd'           => @@password,
      	      'PersistentCookie' => 'yes',
      	      'User-Agent'       => 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'
            }

            http         = Net::HTTP.new("www.google.com", 443)
            http.use_ssl = true
            response     = nil
            http.start do |http|
              request    = Net::HTTP::Post.new("/accounts/ServiceLoginBoxAuth")
              request.set_form_data(params)
              response   = http.request(request)
            end

            doc = Hpricot.parse(response.body)
            
            # if Google Accounts is in the title tag then the login failed
            if (doc/:title).first.inner_html =~ /Google\sAccounts/
              raise InvalidCredentials
            else
              @@cookies = response.response['set-cookie'].split('; ')[0]
              @@logged_in = true
            end
          # hpricot will through a no method error if title tag not found and google doesn't currently have title tag on their login successful redirecting page
          rescue NoMethodError
            @@cookies = response.response['set-cookie'].split('; ')[0]
            @@logged_in = true
          end
          
          def connection_options
            @@connection_options
          end
          
          def cookies
            @@cookies
          end

          def connection_established?
            @@logged_in
          end
        
          def request(path)
            raise "You must establish a connection before making a request" unless connection_established?

            headers = {
              'Cookie'     => @@cookies, 
              'User-Agent' => USERAGENT,
              'et'         => 'reset',
              'hl'         => @@connection_options[:language]
            }

            response, body = nil
            http = Net::HTTP.new("www.google.com", 443)
            http.use_ssl = true
            http.start do |http|
              request  = Net::HTTP::Get.new(path, headers)
              response = http.request(request)
              body     = response.body
            end
            body
          end
          
          def parse(body)
            Hpricot.parse(body)
          end
          
          def parse_xml(xml)
            Hpricot.XML(xml)
          end
        end
      end
    end
  end
end