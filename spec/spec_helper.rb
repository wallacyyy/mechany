ENV['RACK_ENV'] = 'test'
require 'coveralls'
require 'vcr'
require 'celluloid/autostart'
require './lib/mechany'
Coveralls.wear!


VCR.configure do |vcr|
  vcr.cassette_library_dir = File.dirname(__FILE__) + '/cassettes'
  vcr.hook_into :webmock
end

RSpec.configure do |config|
  config.before do
    include Mechany
  end
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = 'random'
end
