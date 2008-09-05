module EnlightenedObservers
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def observer(*observers)
      super

      configuration = observers.last.is_a?(Hash) ? observers.pop : {}
      observers.each do |observer|
        observer_instance = Object.const_get(Inflector.classify(observer)).instance
        class <<observer_instance
          include Enlightenment
        end

        around_filter(observer_instance, :only => configuration[:only])
      end
    end
  end

  module Enlightenment
    def self.included(base)
      base.module_eval do
        attr_accessor :controller
      end
    end

    def before(controller)
      self.controller = controller
    end

    def after(controller)
      self.controller = nil # Clean up for GC
    end
  end
end