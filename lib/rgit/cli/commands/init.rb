require "fileutils"

module Rgit::Cli::Commands
  class Init
    def initialize(root_dir)
      @root_dir = root_dir
    end

    def run(_args)
      git_dir = @root_dir.join(".git")
      return -1 if git_dir.exist?

      FileUtils.mkdir git_dir

      git_dir.join("HEAD").write("ref: refs/heads/main")

      FileUtils.mkdir_p git_dir.join("objects")
      FileUtils.mkdir_p git_dir.join("refs")
    end
  end
end
