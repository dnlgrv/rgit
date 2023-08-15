class Rgit::Blob
  attr_reader :content

  def self.deserialize(input)
    _header, content = input.pack("c*").split("\0")

    new content
  end

  def initialize(content)
    @content = content
  end
end
