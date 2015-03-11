module Core
  module Relations
    class Users < ROM::Relation[Core.config.adapter]
      dataset :users

      def by_email(email)
        restrict(email: email)
      end
    end
  end
end
