require "test_helper"
require "rgit/cli"

require "fileutils"
require "securerandom"

class Rgit::Cli::Commands::InitTest < Minitest::Test
  def setup
    @original_dir = FileUtils.pwd
    @root = Pathname.new(Dir.pwd).join("test", "repos", SecureRandom.hex)
    FileUtils.mkdir_p @root
    FileUtils.cd @root

    @command = Rgit::Cli::Commands::Init.new(@root)
  end

  def teardown
    FileUtils.rm_rf @root
    FileUtils.cd @original_dir
  end

  def test_run_creates_directory_structure
    @command.run

    assert @root.join(".git", "HEAD").exist?
    assert @root.join(".git", "objects").exist?
    assert @root.join(".git", "refs").exist?

    assert_equal "ref: refs/heads/main", @root.join(".git", "HEAD").read
  end

  def test_running_with_existing_git_dir
    @command.run
    assert_equal(-1, @command.run)
  end
end
