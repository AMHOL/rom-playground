module Core
  module Models
    class User < Core::Models::Abstract
      attributes :id, :name, :email
    end
  end
end
