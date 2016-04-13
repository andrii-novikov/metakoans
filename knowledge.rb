class Module
  def attribute(var, &block)
    return attribute(var.keys[0]) {var.values[0]} if var.is_a? Hash
    block = proc{nil} if block.nil?

    attr_accessor var

    define_method :initialize do
      val = instance_eval &block
      instance_variable_set("@#{var}", val)
    end

    define_method "#{var}?" do
      instance_variable_get :"@#{var}"
    end

  end
end
