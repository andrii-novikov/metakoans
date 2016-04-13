class Module
  def attribute arg

    var = arg.is_a?(Hash) ? arg.keys[0] : arg
    val = arg.is_a?(Hash) ? arg.values[0] : nil

    attr_accessor var

    define_method :initialize do
      instance_variable_set("@#{var}", val)
    end

    define_method "#{var}?" do
      instance_variable_get :"@#{var}"
    end

  end


end
