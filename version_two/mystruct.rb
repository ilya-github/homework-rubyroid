class MyStruct
  attr_reader :hash

  def initialize(params = {})
    @hash = params
  end

  def method_missing(method_name, *params)
    if method_name =~ /^(\w+)=$/
      @hash[:"#{$1}"] = params.first
    else
      @hash[:"#{method_name}"]
    end
  end

  def [](val)
    @hash[:"#{val}"]
  end
end
