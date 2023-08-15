require "test_helper"

class TestBlob < Minitest::Test
  def test_deserialize
    blob = Rgit::Blob.deserialize(hello_world_bytes)

    assert_kind_of Rgit::Blob, blob
    assert_equal "Hello World\n", blob.content
  end

  def test_serialize
    blob = Rgit::Blob.new("Hello World\n")

    assert_equal hello_world_bytes, blob.serialize
  end

  private

  def hello_world_bytes
    [0x62, 0x6c, 0x6f, 0x62, 0x20, 0x31, 0x32, 0x00, 0x48, 0x65, 0x6c, 0x6c, 0x6f, 0x20, 0x57, 0x6f, 0x72, 0x6c, 0x64, 0x0a]
  end
end
