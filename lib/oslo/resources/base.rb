require 'oslo/resources/restfully_accessible'
require 'time'

module Oslo::Resources
  class Base
    def self.friendly_attributes(*names)
      names.map(&:to_s).each do |name|
        define_method(name) do
          self[name]
        end
      end
    end

    def self.map_attribute_to_attribute(k_and_v)
      as_json, as_method = *k_and_v.to_a.first.map(&:to_s)
      define_method(as_method) do
        self[as_json]
      end
    end

    def self.map_attribute_to_resource(k_and_v)
      _name, klass = *k_and_v.to_a.first
      name = _name.to_s
      define_method(name) do
        self[[name, klass].join("__")] ||= klass.new(self[name])
      end
    end

    def initialize(data_via_json)
      @data = data_via_json
    end

    def [](name)
      @data[name]
    end

    def []=(name, value)
      @data[name] = value
    end

    def id
      self["id"]
    end

    def created
      if date = self["created"]
        Time.parse(date)
      end
    end

    def updated
      if date = self["updated"]
        Time.parse(date)
      end
    end

    extend RestfullyAccessible
  end
end
