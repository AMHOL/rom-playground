require 'core/concerns/configurable'

module Core
  extend Concerns::Configurable
  extend self

  setting :adapter, :memory

  def setup
    ROM.setup(config.adapter)
    %w(models relations mappers commands).each do |file|
      require "core/#{file}"
    end
    self
  end

  def finalize
    @env = ROM.finalize.env
  end

  def method_missing(method, *args, &block)
    if env.respond_to?(method)
      env.send(method, *args, &block)
    else
      super
    end
  end

  def respond_to_missing?(method, include_private = false)
    env.respond_to?(method, include_private) || super
  end

  private

  attr_reader :env
end
