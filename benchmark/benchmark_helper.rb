$:.unshift File.expand_path '../lib', File.dirname(__FILE__)
require 'event_emitter'
require 'benchmark'

class Bench

  class Error < StandardError
  end

  def self.run
    bench = self.new
    Benchmark.bm do |x|
      bench.methods.select{|i| i.to_s =~ /^bench_(.+)$/}.sort.each do |m|
        x.report m.to_s.scan(/^bench_(.+)$/)[0][0] do
          bench.__send__ m
        end
      end
    end
  end

end
