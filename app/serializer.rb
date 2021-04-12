require 'pry'

class Serializer
  attr_accessor :object

  def initialize(obj)
    @object = obj
  end

  def serialize
    attributes
      .keys
      .each_with_object({}) do |key, hash|
      hash[key] = attributes[key].call(self)
    end
  end

  private

  def attributes
    self.class.attributes
  end

  class << self
    def attributes
      @attributes ||= {}
    end

    def attribute(name, &block)
      attributes[name] = Proc.new do |instance|
        block ? instance.instance_exec(&block) : instance.object[name]
      end
    end
  end
end
