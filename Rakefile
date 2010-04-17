require 'rubygems'
require 'rake/gempackagetask'

spec = Gem::Specification.new do |s|
  s.name            = "leadfoot"
  s.version         = "0.0.1"
  s.author          = "rugek"
  s.email           = "rugek@dirtyhack.net"
  s.platform        = Gem::Platform::RUBY
  s.summary         = "A tiny and dead simple benchmarking suite"
  s.files           = FileList["{bin,lib,sample}/**/*"]
  s.executables     = ['measure']
  s.require_path    = "lib"
end

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.need_tar = true
end
