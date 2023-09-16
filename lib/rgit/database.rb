class Rgit::Database
  attr_reader :dir

  def initialize(dir)
    @dir = dir
  end
end
