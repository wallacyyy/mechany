require 'httparty'
require 'mail'
require 'yaml'
require 'savon'
require 'nokogiri'

require_relative 'mechany/dsl/reader'
require_relative 'mechany/dsl/service'
require_relative 'mechany/endpoints/http/http'
require_relative 'mechany/endpoints/mailing/smtp'
require_relative 'mechany/endpoints/mailing/delivery'
require_relative 'mechany/endpoints/soap/client'
require_relative 'mechany/endpoints/soap/request'
require_relative 'mechany/endpoints/utils/xslt'
require_relative 'mechany/services/group'

module Mechany
  VERSION = '0.2'
end
