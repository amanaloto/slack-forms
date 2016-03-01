class PayrollHero

  def self.all
    Form.payroll_hero
  end

  def self.missing_clock_out
    self.all.select do |form|
      form.data['title'].starts_with? Forms::PayrollHeroForm::PAYROLL_FORM_TYPES[0]
    end
  end

  def self.overtime
    self.all.select do |form|
      form.data['title'].starts_with? Forms::PayrollHeroForm::PAYROLL_FORM_TYPES[1]
    end
  end

  def self.overtime_by_date start_date, end_date
    self.overtime.select do |form|
      overtime_keyword = Forms::PayrollHeroForm::PAYROLL_FORM_TYPES[1] + ':'
      date_string = form.data['title'].sub overtime_keyword, ''
      date = Date.strptime date_string.strip, '%m/%d/%Y'

      date >= start_date && date <= end_date
    end
  end

end
