require "test_helper"

class Rgit::WorkspaceTest < Rgit::Test
  def setup
    setup_test_repo

    @workspace = Rgit::Workspace.new(@repo.dir)
  end

  def teardown
    teardown_test_repo
  end

  def test_list_of_files
    @repo.dir.join("hello.txt").write("hello\n")
    @repo.dir.join("world.txt").write("world\n")
    Dir.mkdir @repo.dir.join("not_included")

    assert_equal ["hello.txt", "world.txt"], @workspace.files.map(&:basename).map(&:to_s).sort
  end
end
