require "rgit/database"

class Rgit::Repo
  attr_reader :dir

  def initialize(dir)
    @dir = dir
    @database = Rgit::Database.new(dir.join(".git"))
  end

  def git_dir
    @database.dir
  end
end
