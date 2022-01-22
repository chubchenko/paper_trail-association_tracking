# frozen_string_literal: true

require "paper_trail_association_tracking/reifier"
module PaperTrail
  module Reifier
    class << self
      prepend ::PaperTrailAssociationTracking::Reifier::ClassMethods
    end
  end
end

require "paper_trail_association_tracking/model_config"
module PaperTrail
  class ModelConfig
    prepend ::PaperTrailAssociationTracking::ModelConfig
  end
end

require "paper_trail_association_tracking/record_trail"
module PaperTrail
  class RecordTrail
    prepend ::PaperTrailAssociationTracking::RecordTrail
  end
end

require "paper_trail_association_tracking/version_concern"
module PaperTrail
  module VersionConcern
    include ::PaperTrailAssociationTracking::VersionConcern
  end
end

require "paper_trail_association_tracking/version_association_concern"
module PaperTrail
  # This is the default ActiveRecord model provided by PaperTrail. Most simple
  # applications will only use this and its partner, `Version`, but it is
  # possible to sub-class, extend, or even do without this model entirely.
  # See the readme for details.
  class VersionAssociation < ::ActiveRecord::Base
    include PaperTrailAssociationTracking::VersionAssociationConcern
  end
end
