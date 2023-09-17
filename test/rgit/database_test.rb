require "test_helper"

class Rgit::DatabaseTest < Rgit::Test
  def setup
    setup_test_repo

    @database = @repo.database
    @blob = Rgit::Blob.new("Hello World\n")
  end

  def teardown
    teardown_test_repo
  end

  def test_store_blob
    assert @database.store(@blob)

    expected_file_path = @database.dir.join("objects", "64", "8a6a6ffffdaa0badb23b8baf90b6168dd16b3a")
    assert File.exist? expected_file_path

    decompressed_contents = Zlib::Inflate.inflate expected_file_path.read
    decompressed_blob = Rgit::Blob.new(decompressed_contents.split("\0").last)

    assert_equal @blob, decompressed_blob
  end
end
