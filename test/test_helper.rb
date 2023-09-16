# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "rgit"

require "debug"
require "minitest/autorun"

class Rgit::Test < Minitest::Test
  def setup_test_repo
    dir = Pathname.new(Dir.pwd).join("test", "repos", SecureRandom.hex)
    FileUtils.mkdir_p dir

    @repo = Rgit::Repo.new(dir)
    @init = Rgit::Cli::Commands::Init.new(@repo)
    @init.run
  end

  def teardown_test_repo
    FileUtils.rm_rf @repo.dir
  end
end
