module Core
  module Concerns
    module Relations
      module Queryable
        module Sql
          OPERATOR_MAP = {
            eq: ->(field, value) { [field => value] },
            neq: ->(field, value) { ["#{field} != ?", value] },
            lt: ->(field, value) { ["#{field} < ?", value] },
            lteq: ->(field, value) { ["#{field} <= ?", value] },
            gt: ->(field, value) { ["#{field} > ?", value] },
            gteq: ->(field, value) { ["#{field} >= ?", value] }
          }

          def filter(field, operator, value)
            __new__(dataset.filter(*OPERATOR_MAP[operator].call(field, value)))
          end

          def order(field, direction = nil)
            direction == :desc ? super(field).reverse : super(field)
          end

          def offset(offset)
            super
          end

          def limit(limit)
            super
          end
        end
      end
    end
  end
end
