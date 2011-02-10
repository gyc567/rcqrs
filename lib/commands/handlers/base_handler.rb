module Commands
  module Handlers
    class BaseHandler
      def initialize(repository)
        @repository = repository
      end
      
      def execute(command)
        raise 'method to be implemented in handler'
      end
    end
  end
end