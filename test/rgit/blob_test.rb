require "test_helper"

class Rgit::BlobTest < Rgit::Test
  def setup
    @blob = Rgit::Blob.new("Hello World\n")
  end

  def test_initialise
    assert_equal "blob 12", @blob.header
    assert_equal "Hello World\n", @blob.content
  end

  def test_equality
    assert_equal Rgit::Blob.new("Hello World\n"), @blob
    refute_equal Rgit::Blob.new("Goodbye World\n"), @blob
  end

  def test_to_s
    assert_equal "blob 12\0Hello World\n", @blob.to_s
  end
end
