module EnlightenedObservers
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def enlighten_observer(*observers)
      enlighten_data_spec = observers.last.is_a?(Hash) ? observers.pop : {}
      observers.each do |observer|
        observer_instance = observer.to_s.camelize.constantize.instance
        around_filter do |controller, action|
          calculated_values = { :controller => self }
          enlighten_data_spec.each_pair { |k,v| calculated_values[k] = self.send(v.to_sym) }
          observer_instance.enlightenment = calculated_values
          action.call
          observer_instance.enlightenment = nil # Other controllers can call this too!
        end
      end
    end
  end

  module Enlightenment
    def self.included(base)
      base.module_eval do
        attr_accessor :enlightenment
      end
    end
  end
end