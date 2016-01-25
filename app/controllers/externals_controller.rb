class ExternalsController < ApplicationController

  before_action :redirect_to_root, :unless => :logged_in?

  def dump
    evaluations =
      Evaluation.joins(:presentation, :user).
      select(
        'evaluations.*, ' \
        'presentations.title AS presentation_title, ' \
        'users.name AS evaluator'
      ).as_json

    if self.current_user.in? self.allowed_users
      render :json => evaluations
    else
      render :nothing => true
    end
  end



  protected

  def allowed_users
    [User.find_by_name('jblanco'), User.find_by_name('amanaloto')]
  end

end
