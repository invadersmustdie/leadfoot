module Leadfoot
  module DSL
    def series(*args, &block)
      puts "=> #{args[0]}"

      yield if block_given?
      puts
    end

    def call_setup(&block)
      @setup_proc.call if @setup_proc
    end

    def setup(&block)
      if block_given?
        @setup_proc = block
      end
    end

    def puts_row(label, result)
      puts "| %s%s | %s" % [
        ' ' * (14-result.to_s.size),
        result,
        label
      ]
    end

    def measure(*args, &block)
      call_setup
      label = args[0]

      t0 = Time.now
      begin
        if block_given?
          yield
          t = Time.now-t0
          puts_row(label, ("%.4f secs" % [t]))
        else
          puts_row(label, "noop")
        end
      rescue => e
        puts_row(label, "failed")
      end
    end
  end
end
