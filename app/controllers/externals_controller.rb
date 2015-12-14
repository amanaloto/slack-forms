class ExternalsController < ApplicationController

  before_action :redirect_to_root, :unless => :logged_in?

  def dump
    admin = User.find_by_name 'jblanco'
    users = User.all
    presentations = Presentation.all
    evaluations = Evaluation.all

    data_hash = {
      :users => users,
      :presentations => presentations,
      :evaluations => evaluations
    }

    if self.current_user == admin
      render :json => data_hash
    else
      render :nothing => true
    end
  end

end
