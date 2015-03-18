require 'core/concerns/relations/queryable/memory'

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
