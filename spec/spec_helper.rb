require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

require 'rspec'
require 'dmarc'

include DMARC

RSpec.configure do |specs|
  specs.filter_run_excluding :gauntlet
end
