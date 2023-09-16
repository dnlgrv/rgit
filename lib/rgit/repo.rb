require "rgit/database"

class Rgit::Repo
  attr_reader :database, :workspace

  def initialize(dir)
    @database = Rgit::Database.new(dir.join(".git"))
    @workspace = Rgit::Workspace.new(dir)
  end

  def dir
    @workspace.dir
  end

  def git_dir
    @database.dir
  end
end
