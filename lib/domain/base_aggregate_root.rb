module Domain
  class BaseAggregateRoot
    include Eventful
        
    attr_reader :guid, :event_version, :applied_events
    
  protected
    
    def initialize
      @version = 0
      @applied_events = []
    end
    
    def apply(event)
      event.aggregate_id = @guid
      event.version = ++@version

      fire(event.class, event)
      
      @applied_events << event
    end
    
    def load(events)
      return if events.count == 0

      events.sort_by {|e| e.version }.each do |event|
        apply(event)
      end

      @version = @events.last.version
    end
  end
end