module Int
  module_function

  def parse(string)
    Integer(string || '')
  rescue ArgumentError
    nil
  end
end
