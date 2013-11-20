ENV['RACK_ENV'] = 'test'
require 'coveralls'
require 'mail'
Coveralls.wear!

Dir[File.dirname(__FILE__) + '/../dsl/*.rb'].each { |file| require file }
Dir[File.dirname(__FILE__) + '/../endpoints/**/*.rb'].each { |file| require file }
Dir[File.dirname(__FILE__) + '/../endpoints/*.rb'].each { |file| require file }

RSpec.configure do |config|
  config.include Dsl::Smtp

  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = 'random'
end
