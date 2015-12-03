class Forms::FormFactory

  def build form_type
    @form_type = form_type.to_sym

    self.get_form_class.new
  end



  protected

  def get_form_class
    case @form_type
    when :daily_buzz
      ::Forms::DailyBuzzForm

    when :payroll_hero
      ::Forms::PayrollHeroForm

    else
      ::Forms::NoForm
    end
  end

end
