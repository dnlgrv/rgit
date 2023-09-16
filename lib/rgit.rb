# frozen_string_literal: true

require_relative "rgit/version"

module Rgit
  class Error < StandardError; end
end

require_relative "rgit/blob"
require_relative "rgit/database"
require_relative "rgit/repo"
require_relative "rgit/workspace"
