class Module
  def attribute(var, &block)
    return attribute(var.keys[0]) {var.values[0]} if var.is_a? Hash

    attr_writer var

    define_method var do
      unless instance_variable_defined? "@#{var}"
        instance_variable_set("@#{var}", instance_eval(&block))
      end
      instance_variable_get "@#{var}"
    end

    define_method "#{var}?" do
      instance_variable_get "@#{var}"
    end
  end
end
