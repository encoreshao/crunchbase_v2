$LOAD_PATH << File.join(File.dirname(__FILE__), "..", "lib")
require 'rspec'
require 'rspec/its'
require 'crunchbase'
require 'date'
require 'yaml'
require 'vcr'

yaml = YAML.load_file(File.join(File.dirname(__FILE__),'apikey.yml'))

Crunchbase::API.key = yaml["key"]
Crunchbase::API.debug = yaml["debug"]

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  c.hook_into :webmock
  c.configure_rspec_metadata!
end

RSpec.configure do |c|
  c.alias_it_should_behave_like_to :it_has_behavior, 'has behavior:'
end

Dir["./spec/support/**/*.rb"].sort.each { |f| require f}
