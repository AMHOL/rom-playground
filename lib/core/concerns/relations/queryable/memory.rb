module Core
  module Concerns
    module Relations
      module Queryable
        module Memory
          OPERATOR_MAP = {
            eq: proc { |tuple, field, value| tuple[field].eql?(value) },
            neq: proc { |tuple, field, value| !tuple[field].eql?(value) },
            lt: proc { |tuple, field, value| tuple[field] < value },
            lteq: proc { |tuple, field, value| tuple[field] <= value },
            gt: proc { |tuple, field, value| tuple[field] > value },
            gteq: proc { |tuple, field, value| tuple[field] >= value },
            regexp: proc { |tuple, field, value| tuple[field] =~ value }
          }

          def project(*fields)
            __new__(dataset.project(*fields))
          end

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
