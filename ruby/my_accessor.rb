# ---------------------------------------------------------------------------
# My own accessor
# ---------------------------------------------------------------------------
module Accessor
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def class_attribute_accessor(var_name)
      instance_eval %{
        def #{var_name}
          @@#{var_name}
        end
        def #{var_name}=(new_value)
          @@#{var_name}=new_value
        end
      }
    end
    def my_attr_accessor(var_name)
      class_eval %{
        def #{var_name}
          @#{var_name}
        end
        def #{var_name}=(new_value)
          @#{var_name} = new_value
        end
      }
    end
  end
  
end

class Example
  include Accessor
  my_attr_accessor :foo
  class_attribute_accessor :baz
end

puts "Class attributes:"
Example.baz = 1
p Example.baz
puts "Instance attributes:"
ex = Example.new
ex.foo = 99
p ex.foo
