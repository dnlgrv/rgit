module Rgit::Cli::Commands
  class Commit
    def initialize(repo)
      @repo = repo
    end

    def run(_args = nil)
      blobs.each do |blob|
        @repo.database.store blob
      end
    end

    private

    def files
      @repo.dir.entries.map do |file|
        @repo.dir.join(file)
      end.reject(&:directory?)
    end

    def blobs
      files.map do |file|
        Rgit::Blob.new file.read
      end
    end
  end
end
