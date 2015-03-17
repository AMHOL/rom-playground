module Core
  module Models
    class User < Core::Models::Abstract
      attributes :name, :email
    end
  end
end
