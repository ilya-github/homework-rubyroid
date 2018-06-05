class MyStruct
  def initialize(params = {})
    @hash = params
    load_data(@hash)
  end

  def method_missing(method_name, *params)
    name = method_name.to_s.delete('=')
    if method_name =~ /\w+=/
      self.class.send :define_method, "#{name}=" do end
      instance_variable_set "@#{name}", params.first
      @hash[name.to_sym] = params.first
    else
      self.class.send :define_method, name do end
      instance_variable_get "@#{name}"
    end
  end

  def [](val)
    send(val)
  end

  private

  def load_data(hash)
    hash.each do |key, val|
      self.class.send :attr_accessor, key
      instance_variable_set "@#{key}", val
    end
  end
end
