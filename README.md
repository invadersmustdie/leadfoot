# leadfoot

A tiny and dead simple benchmarking suite

## Example

    require 'leadfoot'

    class SampleBench < Leadfoot::Case
      def measure_array_push
        arr = []

        measure("array push") do
          1_000.times do
            arr << 42
          end
        end
      end
    end

    SampleBench.new.run!

## Result

    [rugek@blade] (~/devel/ruby/leadfoot) ruby -Ilib example/sample.rb
    == array_push
     * 0.000567 seconds

    1 benchmarks, 0.0006 seconds
