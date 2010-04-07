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
