class Rgit::Blob
  attr_reader :header, :content

  def self.deserialize(input)
    _header, content = input.pack("c*").split("\0")

    new content
  end

  def initialize(content)
    @header = "blob #{content.bytesize}"
    @content = content
  end

  def ==(other)
    header == other.header && content == other.content
  end

  def to_s
    [@header, "\0", @content].join
  end

  def serialize
    to_s.unpack("c*")
  end
end
