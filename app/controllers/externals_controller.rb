class ExternalsController < ApplicationController

  def slash_command
    render :plain => self.build_slack_forms_link
  end



  protected

  def build_slack_forms_link
    app_url = Figaro.env.app_url

    "<#{app_url}/forms/new?form_type=payroll-hero|PayrollForm>\n" \
      "<#{app_url}/form/new?form_type=daily_buzz|DailyBuzzForm>\n" \
      "<#{app_url}/evaluations/new|EvaluationForm>\n" \
  end

end
