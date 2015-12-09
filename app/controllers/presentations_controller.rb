class PresentationsController < ApplicationController

  before_action :build_presentation


  def new
  end

  def create
    @presentation.assign_attributes self.presentation_params

    if @presentation.save
      redirect_to [:new, :evaluation]
    else
      flash[:alert] = 'Presentation creation error!'
      render :new
    end
  end



  protected

  def build_presentation
    @presentation = Presentation.new
  end

  def presentation_params
    params.require(:presentation).permit [:user_id, :title]
  end

end
