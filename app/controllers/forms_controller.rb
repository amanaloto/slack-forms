class FormsController < ApplicationController

  SLACK_URL = 'https://slack.com/api/files.upload'
  SELECTED_FIELDS = [:id, :created, :title, :preview, :user]

  before_action :redirect_to_root,
    :only => [:new],
    :unless => :logged_in?


  def new
    @form_type = params[:form_type].try(:to_sym) || :daily_buzz

    redirect_to [:new, :evaluation] and return if @form_type == :evaluation
  end

  def create
    form_handler = ::Forms::FormFactory.new.build params[:form_type]
    response = self.post_to_slack form_handler.generate_query_string(params)

    if response['ok']
      self.save_form_to_db response['file'], params[:form_type]

      redirect_to :new_form,
        :flash => {:success => 'Successfully posted to slack!'}
    else
      puts response
      redirect_to :new_form, :flash => {:alert => 'Error!'}
    end
  end



  protected

  def post_to_slack query_string
    query_string.merge! :token => session[:access_token]

    JSON.parse RestClient.post(SLACK_URL, query_string)
  end

  def save_form_to_db file_info, type
    Form.create(
      :data => self.filter_data(file_info),
      :form_type => type,
      :user_id => self.current_user.id
    )
  end

  def filter_data data
    data.select { |attr, value| attr.to_sym.in? SELECTED_FIELDS }
  end

end
