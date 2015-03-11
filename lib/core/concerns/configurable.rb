module Core
  module Concerns
    module Configurable
      def config
        @config ||= Struct.new('Config', *settings.keys).new(*settings.values)
      end

      def configure
        yield(config) if block_given?
      end

      private

      def setting(key, default)
        settings[key] = default
      end

      def settings
        @settings ||= {}
      end
    end
  end
end
