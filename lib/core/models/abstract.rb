module Core
  module Models
    class Abstract
      class << self
        def attributes(*attributes, reader: :public, writer: :public)
          attributes.each do |attribute|
            attribute(attribute, reader: reader, writer: writer)
          end
        end

        def attribute(attribute, reader: :public, writer: :public)
          define_attribute(attribute, reader: reader, writer: writer)
        end

        private


        def define_attribute(attribute, reader: nil, writer: nil)
          attr_reader attribute unless reader.nil?
          attr_writer attribute unless writer.nil?
          send(reader, attribute) unless [nil, :public].include?(reader)
          send(writer, attribute) unless [nil, :public].include?(writer)
        end
      end

      def initialize(attributes = {})
        attributes.each_pair do |attr_name, value|
          send("#{attr_name}=", value)
        end
      end
    end
  end
end
