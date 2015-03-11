module Core
  module Commands
    class CreateUser < ROM::Commands::Create[Core.config.adapter]
      register_as :create
      relation :users
      result :one
    end
  end
end
