module Core
  module Relations
    class Base < ROM::Relation[Core.config.adapter]
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
      end

      def filter(field, operator, value)
        dataset.find_all do |tuple|
          OPERATOR_MAPPING[operator].call(tuple, field, value)
        end
      end

      def order(*args, &block)
        dataset.order(*args, &block)
      end

      def offset(offset)
        dataset.drop(offset)
      end

      def limit(limit)
        dataset.take(limit)
      end

      def insert(*args)
        dataset.insert(*args)
        self
      end
      alias_method :<<, :insert

      def delete(*args)
        dataset.delete(*args)
        self
      end

      def count
        dataset.count
      end
    end
  end
end
