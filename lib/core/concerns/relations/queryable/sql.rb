module Core
  module Concerns
    module Relations
      module Queryable
        module Sql
          OPERATOR_MAP = {
            eq: lambda { |field, value| [field => value] },
            neq: lambda { |field, value| ["#{field} != ?", value] },
            lt: lambda { |field, value| ["#{field} < ?", value] },
            lteq: lambda { |field, value| ["#{field} <= ?", value] },
            gt: lambda { |field, value| ["#{field} > ?", value] },
            gteq: lambda { |field, value| ["#{field} >= ?", value] }
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
