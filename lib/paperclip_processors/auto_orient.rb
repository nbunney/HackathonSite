module Paperclip
  class AutoOrient < Paperclip::Processor
    def initialize(file, options = {}, *args)
      @file = file
    end

    def make(*args)
      dst = Tempfile.new([@basename, @format].compact.join('.'))
      dst.binmode

      Paperclip.run('convert', "#{File.expand_path(@file.path)} -auto-orient #{File.expand_path(dst.path)}")

      dst
    end
  end
end
