require 'core/concerns/relations/queryable/memory'
require 'core/concerns/relations/queryable/sql'

module Core
  module Concerns
    module Relations
      module Queryable
        def self.included(base)
          base.send(:include, self.const_get(ROM::Inflector.classify(Core.config.adapter)))
          base.exposed_relations.merge %i(project filter order offset limit count)
        end
      end
    end
  end
end
