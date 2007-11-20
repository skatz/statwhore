require 'statwhore/google/analytics/base'
require 'statwhore/google/analytics/account'
require 'statwhore/google/analytics/profile'

module Statwhore
  module Google
    module Analytics
      USERAGENT                            = 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.0.1) Gecko/20060111 Firefox/1.5.0.1'

      FORMAT_PDF                           = '0'
      FORMAT_XML                           = '1'
      FORMAT_CSV                           = '2'
      FORMAT_TABSEPERATED                  = '3'

      FILTER_DONT_MATCH                    = '1'
      FILTER_MATCH                         = '2'
      
      SORT_DESC                            = '1'
      SORT_ASC                             = '2'
      
      LANGUAGE_ENGLISH_US                  = 'en-US'
      LANGUAGE_ENGLISH_GB                  = 'en-GB'
      LANGUAGE_GERMAN                      = 'de-DE'
      LANGUAGE_FRENCH                      = 'fr-FR'
      LANGUAGE_ITALIAN                     = 'it-IT'
      LANGUAGE_SPANISH                     = 'es-ES'
      LANGUAGE_DUTCH                       = 'nl-NL'
      LANGUAGE_JAPANESE                    = 'ja-JP'
      LANGUAGE_PORTUGUESE_BRAZIL           = 'pt-BR'
      LANGUAGE_DANISH                      = 'da-DK'
      LANGUAGE_FINISH                      = 'fi-FI'
      LANGUAGE_NORWEGIAN                   = 'no-NO'
      LANGUAGE_SWEDISH                     = 'sv-SE'
      LANGUAGE_CHINESE_1                   = 'zh-TW'
      LANGUAGE_CHINESE_2                   = 'zh-CN'
      LANGUAGE_KOREAN                      = 'ko-KR'
      LANGUAGE_RUSSIAN                     = 'ru-RU'
      
      VALID_REPORTS = %w[
        Dashboard
        VisitorsOverview
        VisitorsMapOverlay
        VisitorsNewVsReturning
      ].map { |r| r += 'Report' }
         
      class InvalidCredentials < Exception; end
    end
  end
end