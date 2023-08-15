require "pathname"

module Rgit
  class Cli
    autoload :Commands, "rgit/cli/commands"

    def self.start
      new(ARGV).start
    end

    def initialize(args)
      @args = args

      @commands = {
        "init" => Commands::Init
      }
    end

    def start
      pwd = Pathname.new Dir.pwd
      command, *rest = @args

      klass = @commands[command.downcase]
      klass.new(pwd).run(rest)
    end
  end
end
