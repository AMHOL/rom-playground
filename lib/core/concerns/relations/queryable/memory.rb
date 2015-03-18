module Core
  module Concerns
    module Relations
      module Queryable
        module Memory
          OPERATOR_MAP = {
            eq: lambda { |tuple, field, value| tuple[field].eql?(value) },
            neq: lambda { |tuple, field, value| !tuple[field].eql?(value) },
            lt: lambda { |tuple, field, value| tuple[field] < value },
            lteq: lambda { |tuple, field, value| tuple[field] <= value },
            gt: lambda { |tuple, field, value| tuple[field] > value },
            gteq: lambda { |tuple, field, value| tuple[field] >= value }
          }

          def filter(field, operator, value)
            __new__(dataset.find_all { |tuple|
              OPERATOR_MAP[operator].call(tuple, field.to_sym, value)
            })
          end

          def order(field, direction = nil)
            __new__(dataset.sort { |a, b|
              if direction == :desc
                b[field] <=> a[field]
              else
                a[field] <=> b[field]
              end
            })
          end

          def offset(offset)
            __new__(dataset.drop(offset))
          end

          def limit(limit)
            __new__(dataset.take(limit))
          end

          def count
            dataset.count
          end
        end
      end
    end
  end
end
