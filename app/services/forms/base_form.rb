class Forms::BaseForm

  def generate_query_string
    {}
  end

  def type
    raise 'Override this method!'
  end

end
