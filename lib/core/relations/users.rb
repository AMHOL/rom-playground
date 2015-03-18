module Core
  module Relations
    class Users < ROM::Relation[Core.config.adapter]
      include Core::Concerns::Relations::Queryable

      dataset :users
    end
  end
end
