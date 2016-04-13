class Module
  def attribute *args

    if args[0].is_a?(Hash)
      variables = args[0].keys

      define_method :initialize do
        args[0].each do |var,val|
          instance_variable_set("@#{var}",val)
        end
      end
    else
      variables = args
    end

    attr_accessor *variables

    variables.each do |arg|
      define_method "#{arg}?" do
        instance_variable_get :"@#{arg}"
      end
    end


  end


end
