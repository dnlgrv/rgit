require "pathname"

class Rgit::Cli
  autoload :Commands, "rgit/cli/commands"

  def self.start
    new(ARGV).start
  end

  def initialize(args)
    @repo = Rgit::Repo.new(Pathname.pwd)
    @args = args

    @commands = {
      "init" => Commands::Init
    }
  end

  def start
    command, *rest = @args

    klass = @commands[command.downcase]
    klass.new(@repo).run(rest)
  end
end
