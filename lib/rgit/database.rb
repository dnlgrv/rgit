require "digest"
require "fileutils"
require "zlib"

class Rgit::Database
  attr_reader :dir

  def initialize(dir)
    @dir = dir
  end

  def store(blob)
    content_hash = sha1_hash(blob.content)

    file_dir = objects_dir.join content_hash[..1]
    file_path = file_dir.join content_hash[2..]

    FileUtils.mkdir_p file_dir
    file_path.write compressed(blob.to_s)
  end

  private

  def objects_dir
    dir.join("objects")
  end

  def sha1_hash(content)
    Digest::SHA1.hexdigest content
  end

  def compressed(content)
    Zlib::Deflate.deflate content
  end
end
