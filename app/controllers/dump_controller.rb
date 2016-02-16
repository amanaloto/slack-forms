class DumpController < ApplicationController

  before_action :redirect_to_root, :unless => :logged_in?


  def evaluations
    @forms =
      Evaluation.joins(:presentation, :user).
      select(
        'evaluations.*, ' \
        'presentations.title AS presentation_title, ' \
        'users.name AS evaluator'
      ).as_json

    self.render_if_permitted
  end

  def payroll_hero
    @forms =
      Form.payroll_hero.joins(:user).select 'forms.*, users.name AS submitter'

    self.render_if_permitted
  end

  def daily_buzz
    @forms =
      Form.daily_buzz.joins(:user).select 'forms.*, users.name AS submitter'

    self.render_if_permitted
  end



  protected

  def allowed_users
    [User.find_by_name('jblanco'), User.find_by_name('amanaloto')]
  end

  def render_if_permitted
    if self.current_user.in? self.allowed_users
      render :json => @forms
    else
      render :nothing => true
    end
  end

end
