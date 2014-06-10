ENV['RACK_ENV'] = 'test'
require 'coveralls'
require 'mail'
require 'vcr'
require 'celluloid/autostart'
Coveralls.wear!

Dir[File.dirname(__FILE__) + '/../dsl/*.rb'].each { |file| require file }
Dir[File.dirname(__FILE__) + '/../endpoints/**/*.rb'].each { |file| require file }
Dir[File.dirname(__FILE__) + '/../endpoints/*.rb'].each { |file| require file }
Dir[File.dirname(__FILE__) + '/../services/*.rb'].each { |file| require file }

VCR.configure do |vcr|
  vcr.cassette_library_dir = File.dirname(__FILE__) + '/cassettes'
  vcr.hook_into :webmock
end

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = 'random'
end
