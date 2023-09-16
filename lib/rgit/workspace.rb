class Rgit::Workspace
  attr_reader :dir

  def initialize(dir)
    @dir = dir
  end

  def files
    @dir.entries.map do |file|
      @dir.join(file)
    end.reject(&:directory?)
  end
end
