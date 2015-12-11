class EvaluationsController < ApplicationController

  respond_to :json, :only => [:dump]

  before_action :redirect_to_root,
    :only => [:new],
    :unless => :logged_in?
  before_action :build_evaluation


  def new
  end

  def create
    @evaluation.assign_attributes self.evaluation_params

    if @evaluation.save
      redirect_to [:new, :evaluation],
        :flash => {:success => 'Successful evaluation!'}
    else
      flash[:alert] = 'Evaluation error!'
      render :new
    end
  end



  protected

  def build_evaluation
    @evaluation = self.current_user.evaluations.new
  end

  def evaluation_params
    params.require(:evaluation).permit([
      :presentation_id,
      :relevance,
      :mastery,
      :documentation,
      :presentation_quality,
      :comments
    ])
  end

end
