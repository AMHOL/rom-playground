module Core
  module Mappers
    class UserMapper < ROM::Mapper
      relation :users
      register_as :entity

      model Core::Models::User

      attribute :email
    end
  end
end
