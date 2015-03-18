require 'rom'
require 'rom/memory'

module ROM
  module Test
    class Dataset < ROM::Memory::Dataset; end

    class Relation < ROM::Relation
      include Enumerable

      OPERATOR_MAPPING = {
        eq: proc { |tuple, field, value| tuple[field].eql?(value) },
        neq: proc { |tuple, field, value| !tuple[field].eql?(value) },
        lt: proc { |tuple, field, value| tuple[field] < value },
        lteq: proc { |tuple, field, value| tuple[field] <= value },
        gt: proc { |tuple, field, value| tuple[field] > value },
        gteq: proc { |tuple, field, value| tuple[field] >= value },
        regexp: proc { |tuple, field, value| tuple[field] =~ value }
      }

      # forward :project, :order

      def filter(field, operator, value)
        dataset.find_all do |tuple|
          OPERATOR_MAPPING[operator].call(tuple, field, value)
        end
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

    class Storage < ROM::Memory::Storage; end

    class Repository < ROM::Memory::Repository; end

    module Commands
      class Create < ROM::Memory::Commands::Create; end
      class Update < ROM::Memory::Commands::Update; end
      class Delete < ROM::Memory::Commands::Delete; end
    end
  end
end

ROM.register_adapter(:test, ROM::Test)
