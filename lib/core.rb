require 'rom'
require 'core/concerns/configurable'

module Core
  extend Concerns::Configurable
  extend self

  attr_reader :env, :setup
  private :env, :setup

  setting :adapter, :memory
  setting :dsn, nil
  setting :options, nil

  def load
    @setup = ROM.setup(*config.to_h.values_at(:adapter, :dsn, :options).compact)
    require 'core/db/migrations' if %i(sql).include?(config.adapter)
    %w(models relations mappers commands).each do |file|
      require "core/#{file}"
    end
    self
  end

  def connection
    setup.default.connection
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
end
