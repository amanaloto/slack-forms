class ExternalsController < ApplicationController

  def dump
    users = User.all
    presentations = Presentation.all
    evaluations = Evaluation.all

    data_hash = {
      :users => users,
      :presentations => presentations,
      :evaluations => evaluations
    }

    render :json => data_hash
  end

end
