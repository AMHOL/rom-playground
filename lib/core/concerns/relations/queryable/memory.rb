module Core
  module Concerns
    module Relations
      module Queryable
        module Memory
          OPERATOR_MAP = {
            eq: ->(tuple, field, value) { tuple[field].eql?(value) },
            neq: ->(tuple, field, value) { !tuple[field].eql?(value) },
            lt: ->(tuple, field, value) { tuple[field] < value },
            lteq: ->(tuple, field, value) { tuple[field] <= value },
            gt: ->(tuple, field, value) { tuple[field] > value },
            gteq: ->(tuple, field, value) { tuple[field] >= value }
          }

          def filter(field, operator, value)
            __new__(dataset.select { |tuple|
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
