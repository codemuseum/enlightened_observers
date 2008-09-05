module EnlightenedObservers
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def enlighten_observer(*observers)
      configuration = observers.last.is_a?(Hash) ? observers.pop : {}
      observers.each do |observer|
        observer_instance = observer.to_s.camelize.constantize.instance
        around_filter do |controller, action|
          observer_instance.controller = controller
          action.call
          observer_instance.controller = controller # Other controllers can call this too!
        end
      end
    end
  end

  module Enlightenment
    def self.included(base)
      base.module_eval do
        attr_accessor :controller
      end
    end
  end
end