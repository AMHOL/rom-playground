module Core
  module Concerns
    module Relations
      module Queryable
        def self.included(base)
          base.exposed_relations.merge %i(project filter order offset limit count)
        end

        OPERATOR_MAPPING = {
          eq: proc { |tuple, field, value| tuple[field].eql?(value) },
          neq: proc { |tuple, field, value| !tuple[field].eql?(value) },
          lt: proc { |tuple, field, value| tuple[field] < value },
          lteq: proc { |tuple, field, value| tuple[field] <= value },
          gt: proc { |tuple, field, value| tuple[field] > value },
          gteq: proc { |tuple, field, value| tuple[field] >= value },
          regexp: proc { |tuple, field, value| tuple[field] =~ value }
        }

        def project(*args, &block)
          dataset.project(*args, &block)
          self
        end

        def filter(field, operator, value)
          dataset.find_all do |tuple|
            OPERATOR_MAPPING[operator].call(tuple, field, value)
          end
          self
        end

        def order(*args, &block)
          dataset.order(*args, &block)
          self
        end

        def offset(offset)
          dataset.drop(offset)
          self
        end

        def limit(limit)
          dataset.take(limit)
          self
        end

        def count
          dataset.count
        end
      end
    end
  end
end
