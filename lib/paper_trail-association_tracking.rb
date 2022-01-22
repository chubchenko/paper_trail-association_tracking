# frozen_string_literal: true

require 'paper_trail'
require "paper_trail_association_tracking/config"
require "paper_trail_association_tracking/request"
require "paper_trail_association_tracking/paper_trail"

if defined?(Rails)
  require "paper_trail/frameworks/active_record"
  require "paper_trail_association_tracking/frameworks/rails"
end

module PaperTrailAssociationTracking
  def self.version
    VERSION
  end

  def self.gem_version
    ::Gem::Version.new(VERSION)
  end
end

module PaperTrail
  class << self
    prepend ::PaperTrailAssociationTracking::PaperTrail::ClassMethods
  end

  class Config
    prepend ::PaperTrailAssociationTracking::Config
  end

  module Request
    class << self
      prepend ::PaperTrailAssociationTracking::Request::ClassMethods
    end
  end
end
