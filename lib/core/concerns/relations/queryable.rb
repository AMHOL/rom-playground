module Core
  module Concerns
    module Relations
      module Queryable
        def self.included(base)
          base.send(:forward, :project, :filter, :order, :drop, :take)
        end
      end
    end
  end
end
