ENV['CONSOLE_DEVICE'] ||= 'stdout'
ENV['LOG_LEVEL'] ||= '_min'

ENV['TEST_BENCH_DETAIL'] ||= ENV['D']

puts RUBY_DESCRIPTION

require_relative '../init'

require 'test_bench'; TestBench.activate

require 'digest/hash/controls'

Controls = Digest::Hash::Controls
