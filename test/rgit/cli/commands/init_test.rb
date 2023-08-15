require "test_helper"
require "rgit/cli"

require "fileutils"
require "securerandom"

class Rgit::Cli::Commands::InitTest < Minitest::Test
  def setup
    @original_dir = FileUtils.pwd
    @path = Pathname.new(Dir.pwd).join("test", "repos", SecureRandom.hex)
    FileUtils.mkdir_p @path
    FileUtils.cd @path

    @command = Rgit::Cli::Commands::Init.new
  end

  def teardown
    FileUtils.rm_rf @path
    FileUtils.cd @original_dir
  end

  def test_run_creates_directory_structure
    @command.run @path

    assert @path.join(".git", "HEAD").exist?
    assert @path.join(".git", "objects").exist?
    assert @path.join(".git", "refs").exist?

    assert_equal "ref: refs/heads/main", @path.join(".git", "HEAD").read
  end

  def test_running_with_existing_git_dir
    @command.run @path

    assert_equal(-1, @command.run(@path))
  end
end
