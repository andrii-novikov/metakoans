class Module
  def attribute arg, &block

    var = arg.is_a?(Hash) ? arg.keys[0] : arg

    attr_accessor var

    define_method :initialize do
      if arg.is_a?(Hash)
        val = arg.values[0]
      elsif block_given?
        val = instance_eval &block
      end

      instance_variable_set("@#{var}", val) if defined? val
    end

    define_method "#{var}?" do
      instance_variable_get :"@#{var}"
    end

  end


end
