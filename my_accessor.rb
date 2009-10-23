module Accessor
  def my_attr_accessor(var_name)
    puts "inside my_attr_accessor"
    var = "@#{var_name}"
    define_method(var_name) do
      instance_variable_get(var)
    end
    define_method("#{var_name}=") do |new_value|
      STDERR.puts "#{var} => #{new_value}"
      instance_variable_set(var, new_value)
    end
  end
end

class Example
  extend Accessor
  my_attr_accessor :foo
end

ex = Example.new
ex.foo = 99
p ex.foo
ex.foo = 1
ex.foo = 2
ex.foo = 3
