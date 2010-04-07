# leadfoot

A tiny and dead simple benchmarking suite

## Test/Unit behavior

### Example

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

### Result

    [rugek@blade] (~/devel/ruby/leadfoot) ruby -Ilib example/sample.rb
    == array_push
     * 0.000567 seconds

    1 benchmarks, 0.0006 seconds

## DSL way

### Example

    series "my first series" do
      setup do
        @x = 2
      end

      measure "gimme 5" do
        @x + 3
      end

      measure "2 seconds" do
        sleep 2
      end

      measure "fail on error" do
        raise "foo"
      end
    end

### Result

    [rugek@blade] (~/devel/ruby/leadfoot) ruby -Ilib bin/measure example/a.ms
    loading example/a.ms
    => my first series
    |    0.0000 secs | gimme 5
    |    2.0023 secs | 2 seconds
    |         failed | fail on error
