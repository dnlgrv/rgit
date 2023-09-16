require "fileutils"

module Rgit::Cli::Commands
  class Init
    def initialize(repo)
      @repo = repo
    end

    def run(_args = nil)
      return -1 if git_dir.exist?

      FileUtils.mkdir git_dir

      git_dir.join("HEAD").write("ref: refs/heads/main")

      FileUtils.mkdir_p git_dir.join("objects")
      FileUtils.mkdir_p git_dir.join("refs")
    end

    private

    def git_dir
      @repo.git_dir
    end
  end
end
