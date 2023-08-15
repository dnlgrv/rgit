class Rgit::Blob
  attr_reader :content

  def self.deserialize(input)
    _header, content = input.pack("c*").split("\0")

    new content
  end

  def initialize(content)
    @header = "blob #{content.bytesize}"
    @content = content
  end

  def serialize
    [@header, "\0", @content].join.unpack("c*")
  end
end
