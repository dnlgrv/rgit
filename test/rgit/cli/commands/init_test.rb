require "test_helper"
require "rgit/cli"

require "fileutils"
require "securerandom"

class Rgit::Cli::Commands::InitTest < Rgit::Test
  def setup
    setup_test_repo
  end

  def teardown
    teardown_test_repo
  end

  def test_run_creates_directory_structure
    assert @repo.dir.join(".git", "HEAD").exist?
    assert @repo.dir.join(".git", "objects").exist?
    assert @repo.dir.join(".git", "refs").exist?

    assert_equal "ref: refs/heads/main", @repo.dir.join(".git", "HEAD").read
  end

  def test_running_with_existing_git_dir
    assert_equal(-1, @init.run)
  end
end
