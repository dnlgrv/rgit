class Rgit::Blob
  attr_reader :header, :content

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
end
