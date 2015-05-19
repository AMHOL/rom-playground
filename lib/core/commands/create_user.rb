module Core
  module Commands
    class CreateUser < ROM::Commands::Create[Core.config.adapter]
      register_as :create
      relation :users
      result :one
      validator Core::Validators::User

      def execute(user)
        super({ id: SecureRandom.uuid }.merge(user))
      end
    end
  end
end
