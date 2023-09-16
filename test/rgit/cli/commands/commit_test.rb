require "test_helper"
require "rgit/cli"

class Rgit::Cli::Commands::CommitTest < Rgit::Test
  def setup
    setup_test_repo

    @commit = Rgit::Cli::Commands::Commit.new(@repo)
  end

  def teardown
    teardown_test_repo
  end

  def test_committing_writes_objects_for_each_file
    @repo.dir.join("hello.txt").write("hello\n")
    @repo.dir.join("world.txt").write("world\n")
    Dir.mkdir @repo.dir.join("not_included")

    @commit.run

    object_files = @repo.git_dir.join("objects").entries.reject(&:directory?)
    assert_equal 2, object_files.length
  end
end
