class ExternalsController < ApplicationController

  def slash_command
    render :plain => self.build_slack_forms_link
  end



  protected

  def build_slack_forms_link
    app_url = Figaro.env.app_url

    "<#{app_url}/forms/new?form_type=payroll-hero|PayrollHero Form>\n" \
      "<#{app_url}/forms/new?form_type=daily_buzz|DailyBuzz Form>\n" \
      "<#{app_url}/evaluations/new|Evaluation Form>\n" \
  end

end
