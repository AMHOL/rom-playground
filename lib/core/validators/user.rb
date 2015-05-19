module Core
  module Validators
    class User
      ValidationError = Class.new(ROM::CommandError)

      def self.call(params)
        unless params[:id] && params[:name] && params[:email]
          raise ValidationError, ":id, :name and :email are required"
        end
      end
    end
  end
end
