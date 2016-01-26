class DumpController < ApplicationController

  before_action :redirect_to_root, :unless => :logged_in?


  def evaluations
    evaluations =
      Evaluation.joins(:presentation, :user).
      select(
        'evaluations.*, ' \
        'presentations.title AS presentation_title, ' \
        'users.name AS evaluator'
      ).as_json

    self.render_if_permitted evaluations
  end

  def payroll_hero
    payroll_hero_forms =
      Form.payroll_hero.joins(:user).select 'forms.*, users.name AS submitter'

    self.render_if_permitted payroll_hero_forms
  end

  def daily_buzz
    daily_buzz_forms =
      Form.daily_buzz.joins(:user).select 'forms.*, users.name AS submitter'

    self.render_if_permitted daily_buzz_forms
  end



  protected

  def allowed_users
    [User.find_by_name('jblanco'), User.find_by_name('amanaloto')]
  end

  def render_if_permitted forms
    if self.current_user.in? self.allowed_users
      render :json => forms
    else
      render :nothing => true
    end
  end

end
