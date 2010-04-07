module Leadfoot
  class Case
    def initialize
      @runtime = 0
      @benchmarks = 0
      @errors = 0
    end

    def run!
      self.methods.grep(/^measure_/).each do |m|
        run_measure_method(m)
      end

      print_summary
    end

    private

    def measure(label, &block)
      t0 = Time.now
      yield if block_given?
      Time.now - t0
    end

    def print_summary
      puts "%d benchmarks, %.4f seconds" % [
        @benchmarks,
        @runtime
      ]
    end

    def run_measure_method(meth_name)
      @benchmarks += 1

      label = meth_name.match(/^measure_(.*)/)[1]
      puts "== #{label}"
      begin
        result = self.__send__(meth_name.to_sym)
        @runtime += result
        puts " * #{result} seconds"
      rescue => e
        puts " - failed"
        @errors += 1
      end
      puts
    end
  end
end
